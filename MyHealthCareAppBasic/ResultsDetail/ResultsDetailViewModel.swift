//
//  ResultsDetailViewModel.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/16/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class ResultsDetailViewModel: NSObject {
    
    private var articleResults = [MainResult]()
    private var tableView: UITableView?
    private var managedVc: UIViewController?
    
    init(articleResults: [MainResult], tableView: UITableView, managedVC: UIViewController) {
        super.init()
        self.articleResults = articleResults
        self.tableView = tableView
        self.managedVc = managedVC
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ResultsDetailViewModel: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ResultsTableViewCell
        cell.configureCell(articleResults[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = managedVc else {return}
        let selectedTopic = articleResults[indexPath.row]
        let safariDelegate = SafariLaunchDelegate(url: selectedTopic.AccessibleVersion, managedView: vc)
        safariDelegate.launchSafariView()
    }
    
}


