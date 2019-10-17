//
//  ResultsDetailTableViewController.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class ResultsDetailTableViewController: UITableViewController {
    internal var healthResults = [MainResult]()
    private var resultsViewModel: ResultsDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsViewModel = ResultsDetailViewModel(articleResults: healthResults, tableView: self.tableView, managedVC: self)
        
    }
    
    
    
    
    
    
    
}
