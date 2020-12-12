//
//  PromotionsTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 18/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class PromotionsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageViewDesignable!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setImage(image:UIImage){
        imageV.image = image
    }
}
