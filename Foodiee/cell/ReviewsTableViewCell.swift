//
//  ReviewsTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 16/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewerText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
//    func setInfo(_ info:Reviews) {
//        reviewerName.text = info.reviewerName
//        reviewerText.text = info.reviewerWords
//    }
}
