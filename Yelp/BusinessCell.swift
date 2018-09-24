//
//  BusinessCell.swift
//  Yelp
//
//  Created by Sierra Klix on 9/24/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    var business: Business!{
        didSet{
            resturantName.text = business.name
            businessImage.setImageWith(business.imageURL!)
            catergoryLabel.text = business.categories
            addressLabel.text = business.address
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            ratingImage.image = business.ratingImage
            distanceLabel.text = business.distance
        }
    }
    @IBOutlet weak var expenseRatingLabel: UILabel!
    @IBOutlet weak var catergoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var businessImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
