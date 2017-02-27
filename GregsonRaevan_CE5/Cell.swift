//
//  Cell.swift
//  GregsonRaevan_CE5
//
//  Created by Raevan Gregson on 12/5/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    //outlets for table cells
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brand: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
