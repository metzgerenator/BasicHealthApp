//
//  AlamoRouter.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum AlamoRouter: URLRequestConvertible {
   
    static let baseURL = "https://healthfinder.gov/api/v2"
    
    static var apiKey = "demo_api_key"
    
    case myHealthFinderJson([String: Any])
    
    var method: HTTPMethod {
        switch self {
        case .myHealthFinderJson:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .myHealthFinderJson:
            return "/myhealthfinder.json"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .myHealthFinderJson(let parameters):
            var finalParams = parameters
            finalParams.updateValue(AlamoRouter.apiKey, forKey: MyHealthSelectionKeys.api_key.rawValue)
            return finalParams
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try AlamoRouter.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        return try URLEncoding.default.encode(request, with: parameters)
        
       }
    
    
    public static func alamoRouterRequest(withRoute: AlamoRouter, completion: @escaping(_ success: Bool, _ response: JSON?) -> Void) {
        Alamofire.request(withRoute).responseJSON { (response) in
            guard let statusCode =  response.response?.statusCode, statusCode == 200 else {completion(false, nil); return}
            if let json = response.result.value {
                let json = JSON(json)
                completion(true, json["Result"])
            } else {
                completion(false, nil)
            }
        }
       
    }
    
}

