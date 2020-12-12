//
//  ChatSenderTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 23/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ChatSenderTableViewCell: UITableViewCell {

    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var message: UILabel!
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
