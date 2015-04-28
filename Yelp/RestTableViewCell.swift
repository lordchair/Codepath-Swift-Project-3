//
//  RestTableViewCell.swift
//  Yelp
//
//  Created by Yale Thomas on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class RestTableViewCell: UITableViewCell {

    var myBusiness: Business!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var ratingView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numRatingsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var monayLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateInfo() {
        if (myBusiness == nil) {
            return
        }
        
        nameLabel.text = myBusiness.valueForKeyPath("name") as? String
        var numRatings = myBusiness.valueForKeyPath("reviewCount") as! Int
        numRatingsLabel.text = "\(numRatings) Ratings"
        distanceLabel.text = myBusiness.valueForKeyPath("distance") as? String
        addressLabel.text = myBusiness.valueForKeyPath("address") as? String
        genreLabel.text = myBusiness.valueForKeyPath("categories") as? String
        
        if var url = myBusiness.valueForKeyPath("imageURL") as? NSURL {
            posterImageView.setImageWithURL(url)
        }
        
        if var url = myBusiness.valueForKeyPath("ratingImageURL") as? NSURL {
            ratingView.setImageWithURL(url)
        }
        
        print(myBusiness)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
