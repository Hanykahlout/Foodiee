//
//  CardCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 21/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var cardNumber: UILabel!
    
    
    @IBOutlet weak var expDate: UILabel!
    
    @IBOutlet weak var cardHolderName: UILabel!
    func setwidthAndHeight(width:CGFloat,height:CGFloat) {
        bgImage.widthAnchor.constraint(equalToConstant: width).isActive = true
        bgImage.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    func setData(_ cardInfo:CardInfo)  {
        bgImage.image = cardInfo.bgImage
        cardNumber.text = cardInfo.cardNumber
        expDate.text = cardInfo.expDate
        cardHolderName.text = cardInfo.cardHolderName
    }
}
