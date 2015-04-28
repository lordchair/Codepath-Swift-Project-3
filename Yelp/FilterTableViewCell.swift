//
//  FilterTableViewCell.swift
//  Yelp
//
//  Created by Yale Thomas on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var enabledSwitch: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myCategory: Category?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData() {
        if (myCategory == nil) {
            return
        }
        
        nameLabel.text = myCategory?.label
        enabledSwitch.setOn(myCategory!.selected, animated: false)
    }

}
