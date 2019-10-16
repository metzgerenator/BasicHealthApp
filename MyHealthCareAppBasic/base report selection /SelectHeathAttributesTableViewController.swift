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

    @IBOutlet weak var currentAge: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func sliderAction(_ sender: UISlider) {
        selectedAge = Int(sender.value)
    }
    @IBAction func genderSelect(_ sender: UISegmentedControl) {
        isMale = sender.selectedSegmentIndex == 0 ? true : false
    }
    
    
    @IBAction func getHealthInfo(_ sender: Any) {
        if let currentAge = selectedAge {
           
            let newQuery: [String : Any] = [MyHealthSelectionKeys.age.rawValue : currentAge,
                            MyHealthSelectionKeys.sex.rawValue :  isMale ? MyHealthSelectionKeys.male.rawValue : MyHealthSelectionKeys.female.rawValue]
            AlamoRouter.alamoRouterRequest(withRoute: .myHealthFinderJson(newQuery)) { (success, json) in
               let result =  MainResult.responseTopics(json: json)
                print(result)
            }
            
        } else {
            self.presentBasicAlert(withTitle: "Select Age", withMessage: "Please select an age")
        }
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
