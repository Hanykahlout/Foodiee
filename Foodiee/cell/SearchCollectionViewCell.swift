//
//  SearchCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 17/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var totalItem: UILabel!
    func setData(_ meal:SearchCellInfo){
        mealImage.image = meal.image
        mealName.text = meal.mealName
        totalItem.text = meal.totalItemText
    }
}
