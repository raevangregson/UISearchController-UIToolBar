//
//  ResultsCell.swift
//  GregsonRaevan_CE5
//
//  Created by Raevan Gregson on 12/6/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {
    
    //cell outlets
    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var resultsBrand: UILabel!
    @IBOutlet weak var resultsName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
