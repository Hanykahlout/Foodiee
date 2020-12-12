//
//  MyBagTableViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 20/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

protocol changeDelegate {
    func changeNumberOfMeal(index:IndexPath,number:String)
}

class MyBagTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    @IBOutlet weak var numberOfMeal: UILabel!
    
    var delegate:changeDelegate?
    var index:IndexPath!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(data:BagInfo,index:IndexPath) {
        self.index = index
        mealImage.image = data.mealImage
        mealName.text = data.mealName
        mealPrice.text = data.mealPrice
        numberOfMeal.text = data.mealNumber
    }
    
    @IBAction func increseMealNumber(_ sender: Any) {
        let x =  (Int(numberOfMeal.text!) ?? 0) + 1
        numberOfMeal.text = String(x)
        if let _delegte = delegate{
            _delegte.changeNumberOfMeal(index: index,number:String(x))
        }
        
    }

    @IBAction func decreseMealNumber(_ sender: Any) {
        let x =  (Int(numberOfMeal.text!) ?? 0) - 1
        if x >= 0 {
            numberOfMeal.text = String(x)
            if let _delegte = delegate{
                _delegte.changeNumberOfMeal(index: index,number:String(x))
            }
        }
    }
}
