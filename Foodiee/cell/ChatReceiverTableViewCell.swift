//
//  ChatReceiverTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 23/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ChatReceiverTableViewCell: UITableViewCell {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
