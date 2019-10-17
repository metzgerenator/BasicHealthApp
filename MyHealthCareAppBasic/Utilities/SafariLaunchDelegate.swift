//
//  SafariLaunchDelegate.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/16/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit
import SafariServices

class SafariLaunchDelegate: NSObject {
    var url: String
    var managedView: UIViewController
    
    init(url: String, managedView: UIViewController) {
        self.url = url
        self.managedView = managedView
    }
    
    private func launchSafariView() {
        guard let url = URL(string: url) else {return}
        let safariVc =  SFSafariViewController(url: url)
        managedView.present(safariVc, animated: true, completion: nil)
        safariVc.delegate = self
    }
}

extension SafariLaunchDelegate: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
