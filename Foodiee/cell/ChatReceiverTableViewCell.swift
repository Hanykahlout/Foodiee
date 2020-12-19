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
        setImage()
    }
    func setImage() {
        FStorage.init().downloadImage(id: UserDefaultsData.init().getUserId(), imageView: receiverImage)
    }
    func setData(messageText:String,messageTime:String) {
        message.text = messageText
        time.text = messageTime
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
