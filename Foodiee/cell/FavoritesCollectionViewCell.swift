//
//  FavoritesCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 20/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var rateNumber: UILabel!
    
   func setInfo(info:FavoritesInfo) {
        imageView.image = info.image
        mealName.text = info.mealName
        rateNumber.text = info.rateNumber
    }
}
