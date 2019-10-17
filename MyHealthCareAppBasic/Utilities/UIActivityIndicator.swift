//
//  UIActivityIndicator.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/16/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

extension UIViewController {
    func showIndicator() -> UIActivityIndicatorView {
        let indicator  = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.medium
        self.view.addSubview(indicator)
        return indicator
        
    }
}
