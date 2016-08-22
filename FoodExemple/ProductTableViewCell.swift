//
//  ProductTableViewCell.swift
//  FoodExemple
//
//  Created by junior on 20/08/16.
//  Copyright © 2016 junior. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected , animated: animated)
        
    }
}
