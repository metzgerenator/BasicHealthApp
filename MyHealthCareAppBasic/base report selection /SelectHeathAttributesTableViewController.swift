//
//  SelectHeathAttributesTableViewController.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class SelectHeathAttributesTableViewController: UITableViewController {
    
    
    private var selectedAge: Int? {
        didSet {
            currentAge.text = "\(selectedAge ?? 0)"
        }
    }
    
    private var isMale = true
//    private var isMale: Bool? {
//        didSet {
//            print(isMale)
//        }
//    }
//
    @IBOutlet weak var currentAge: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func sliderAction(_ sender: UISlider) {
        selectedAge = Int(sender.value)
    }
    @IBAction func genderSelect(_ sender: UISegmentedControl) {
        isMale = sender.selectedSegmentIndex == 0 ? true : false
    }
    
    
    @IBAction func getHealthInfo(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderOutlet.maximumValue = 100
        sliderOutlet.minimumValue = 1

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

 
    
}
