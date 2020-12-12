//
//  imagesCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 14/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class imagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var centerImageView: UIImageView!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    var isSetGradintColor:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData() {
    setimageGradint()
    backgroundImageView.image = UIImage(named: "Dish 2")!
    centerImageView.image = UIImage(named:"Dish 1")!
    headerLabel.text = "saaldad"
    detailsLabel.text = "ldkaslakjaskdhfkjlashjkdashfjkafhalkjhfjkahfladjfhakljshflkajshfkjashflkjashfjkhjjfjdjdjdjjdjdjdjdjdjdjdjdjdjdjdjddjdjdjdjdjjd"
    }
    func setData2() {
    setimageGradint()
    backgroundImageView.image = UIImage(named: "Dish 2")!
    centerImageView.image = UIImage(named:"Dish 1")!
    headerLabel.text = "xxxxxxxxxx"
    detailsLabel.text = "ldkaslakjaskdhfkjlashjkdashfjkafhalkjhfjkahfladjfhakljshflkajshfkjashflkjashfjkhjjfjdjdjdjjdjdjdjdjdjdjdjdjdjdjdjddjdjdjdjdjjd"
    }
    
    func setimageGradint(){
        if !isSetGradintColor{
        let points = [GradientPoint(location: 0, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1547378229)), GradientPoint(location: 0.2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08379151221)), GradientPoint(location: 0.4, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2326315536)),
                  GradientPoint(location: 0.6, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4982341325)), GradientPoint(location: 0.8, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4982341325))]
        backgroundImageView.gradated(gradientPoints: points)
        isSetGradintColor = true
        }
    }
}
