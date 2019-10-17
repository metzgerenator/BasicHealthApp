//
//  ResultsTableViewCell.swift
//  MyHealthCareAppBasic
//
//  Created by Mike on 10/16/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit
import SDWebImage

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    func configureCell(_ mainResult: MainResult) {
        articleTitle.text = mainResult.title
        resultImage.sd_setImage(with: URL(string: mainResult.imageURL), placeholderImage: #imageLiteral(resourceName: "genericMedical"))
    }

}
