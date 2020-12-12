//
//  HistoryMealTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 17/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class HistoryMealTableViewCell: UITableViewCell {

    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var historyText: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(_ history:HistoryCellInfo){
        mealImage.image = history.mealImage
        mealName.text = history.mealName
        historyText.text = history.historyText
        mealPrice.text = history.mealPrice
    }
    @IBAction func reorderAction(_ sender: Any) {
    }
}
