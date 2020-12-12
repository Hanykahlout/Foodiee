//
//  OfferImagesCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 15/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class OfferImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var offerImageView: UIImageView!

    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageWidth.constan t = UIScreen.init().bounds.width
    }
    
    func setImage(_ image:UIImage) {
        offerImageView.image = image
    }
}
