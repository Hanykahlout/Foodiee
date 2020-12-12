//
//  CategoriesCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 16/10/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet var starsRate: [UIButton]!
    @IBOutlet weak var rateNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func setInfo(meal:Meal) {
//        image.image = UIImage(data: meal.image ?? Data())
//        mealName.text = meal.name ?? "This Meal Is Not Available"
//        setStarsRate(rate : meal.mealRate)
//    }
    
    func setStarsRate(rate : Float){
        let rateNum = Int(rate)
        for i in 0...starsRate.count - 1 {
            if i < rateNum {
                starsRate[i].tintColor = .yellow
            }else{
                starsRate[i].tintColor = UIColor(named : "unSelectedStarsColor")
            }
        }
    }
}
