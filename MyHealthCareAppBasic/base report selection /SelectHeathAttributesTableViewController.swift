//
//  SelectHeathAttributesTableViewController.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class SelectHeathAttributesTableViewController: UITableViewController {
    private var segueIdentifer = "results"
    
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
       checkApi()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderOutlet.maximumValue = 100
        sliderOutlet.minimumValue = 1

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

 
    
}


extension SelectHeathAttributesTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifer {
            guard let vc = segue.destination as? ResultsDetailTableViewController,
                let results = sender as? [MainResult] else {return}
            vc.healthResults = results
        }
    }
}




//MARK: query api and present detail

extension SelectHeathAttributesTableViewController {
    
    private func checkApi() {
        if let currentAge = selectedAge {
            let indicator = self.showIndicator()
            indicator.startAnimating()
            let newQuery: [String : Any] = [MyHealthSelectionKeys.age.rawValue : currentAge,
                                            MyHealthSelectionKeys.sex.rawValue :  isMale ? MyHealthSelectionKeys.male.rawValue : MyHealthSelectionKeys.female.rawValue]
            AlamoRouter.alamoRouterRequest(withRoute: .myHealthFinderJson(newQuery)) { (success, json) in
                indicator.stopAnimating()
                indicator.removeFromSuperview()
                if success {
                    guard let jsonResult = json else {return}
                    let result =  MainResult.responseTopics(json: jsonResult)
                    self.performSegue(withIdentifier: self.segueIdentifer, sender: result)
                }
            }
            
        } else {
            self.presentBasicAlert(withTitle: "Select Age", withMessage: "Please select an age")
        }
    }
    
}
