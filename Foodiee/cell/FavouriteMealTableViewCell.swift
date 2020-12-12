//
//  FavouriteMealTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 23/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class FavouriteMealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var selectedSginLabel: UILabel!
    
    var index:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        mealNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        selectedSginLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setNames(name : FavouriteMealNameInfo) {
        mealNameLabel.text = name.mealName
        mealNameLabel.textColor = name.mealNameColor
        selectedSginLabel.textColor = name.selectedSignColor
    }
}
