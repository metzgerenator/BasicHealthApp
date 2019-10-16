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
    
    init(articleResults: [MainResult], tableView: UITableView) {
        super.init()
        self.articleResults = articleResults
        self.tableView = tableView
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
}


