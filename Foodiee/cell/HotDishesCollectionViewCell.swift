//
//  HotDishesCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 28/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class HotDishesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var BGImage: UIImageView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealRate: UILabel!
    @IBOutlet var mealStars: [UIButton]!
    
    func setCellInfo() {
        //        BGImage.image = UIImage(data:mealInfo.BGimage ?? Data())
        //        image.image = UIImage(data:mealInfo.image ?? Data())
        //        mealName.text = mealInfo.name
        //        mealRate.text = String(mealInfo.mealRate)
        //        setStarsRate(rate: mealInfo.mealRate)
        BGImage.image = UIImage(named: "G1")!
        image.image = UIImage(named: "S1")!
        mealName.text = "alsdklda"
        mealRate.text = "3.5"
    }
    
    func setStarsRate(rate:Float) {
        for i in 0...mealStars.count - 1 {
            if i < Int(rate) {
                mealStars[i].tintColor = .yellow
            }else{
                mealStars[i].tintColor = .white
            }
        }
    }
    
}
