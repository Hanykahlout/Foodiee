//
//  FavoritesSortButtonsCollectionViewCell.swift
//  Foodiee
//
//  Created by Hany Kh on 27/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

import DropDown

class FavoritesSortButtonsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ourButton: UIButton!
    
    let dropDown = DropDown()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setButtonDetailes(_ details:ButtonDetails){
        
        ourButton.setTitle(details.buttonName, for: .normal)
        ourButton.setTitleColor(details.textColor, for: .normal)
        ourButton.backgroundColor = details.BGColor
        ourButton.widthAnchor.constraint(equalToConstant: details.buttonWidth).isActive = true
        
        if details.isDropDownList {
            addButtonImage()
            ourButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        }else{
            ourButton.addTarget(self, action: #selector(allAction), for: .touchUpInside)
        }
    }
    
    @objc func addAction() {
        switch ourButton.titleLabel!.text {
        case "Type of meal":
            dropDown.dataSource = ["Healthy Food", "Chinese Food", "Desserts", "Cocktails"]
            dropDown.anchorView = ourButton
            dropDown.bottomOffset = CGPoint(x: 0, y: ourButton.frame.size.height)
            dropDown.show()
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in
                guard let _ = self else { return }
                switch index {
                case 0:
                    print("Healthy Food")
                    break
                case 1:
                    print("Chinese Food")
                    break
                case 2:
                    print("Desserts")
                    break
                case 3:
                    print("Cocktails")
                    break
                default:
                    break
                }
            }
        case "Price Range" :
            dropDown.dataSource = ["$20-$50", "$50-$80", "$80-$120", "$120-$150"]
            dropDown.anchorView = ourButton
            dropDown.bottomOffset = CGPoint(x: 0, y: ourButton.frame.size.height)
            dropDown.show()
            dropDown.selectionAction = { [weak self] (index: Int, item: String) in
                guard let _ = self else { return }
                switch index {
                case 0:
                    print("$20-$50")
                    break
                case 1:
                    print("$50-$80")
                    break
                case 2:
                    print("$80-$120")
                    break
                case 3:
                    print("$120-$150")
                    break
                default:
                    break
                }
            }
            break
        default:
            break;
        }
    }
    
    @objc func allAction(){
        print("Here We Should All Meals Shown ")
    }
    func addButtonImage() {
        let image = UIImage(named: "Icon ionic-ios-arrow-bottom")
        ourButton.setImage(image, for: .normal)
        
        ourButton.titleEdgeInsets = UIEdgeInsets(top: 7, left: 15, bottom: 8, right: 29)
        ourButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 10)
        ourButton.tintColor = .black
        
        ourButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        ourButton.imageView?.centerYAnchor.constraint(equalTo: ourButton.centerYAnchor, constant: 0.0).isActive = true
        ourButton.imageView?.trailingAnchor.constraint(equalTo: ourButton.trailingAnchor, constant: -12 ).isActive = true
    }
}
