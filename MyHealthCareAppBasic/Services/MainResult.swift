
//
//  mainResult.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MainResult {
    enum mainResultKey:String {
        case  Title,
        ImageUrl,
        AccessibleVersion,
        Resources,
        Interest,
        Resource
    }
    
    var title: String
    var imageURL: String
    var AccessibleVersion: String
    
    init(json: JSON) {
        self.title = json[mainResultKey.Title.rawValue].stringValue
        self.imageURL = json[mainResultKey.ImageUrl.rawValue].stringValue
        self.AccessibleVersion = json[mainResultKey.AccessibleVersion.rawValue].stringValue
        
    }
    
    static func responseTopics(json: JSON) -> [MainResult] {
        let jsonArray = json[mainResultKey.Resources.rawValue][mainResultKey.Interest.rawValue][mainResultKey.Resource.rawValue].arrayValue
        return jsonArray.map{MainResult(json: $0)}
    }
    
    
}
