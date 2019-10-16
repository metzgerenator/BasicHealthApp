//
//  BasicAlertControllers.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentBasicAlert(withTitle: String,  withMessage: String) {
        let alertVc = UIAlertController(title: withTitle, message: withTitle, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction.init(title: "Ok" , style: .cancel, handler: nil))
        self.present(alertVc, animated: true, completion: nil)
    }
}



