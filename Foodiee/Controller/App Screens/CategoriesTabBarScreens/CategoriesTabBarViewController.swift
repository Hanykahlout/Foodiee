//
//  CategoriesTabBarViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 15/10/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class CategoriesTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.unselectedItemTintColor = UIColor(named: "UnSelectedTabBarItemColor")!
        removeBackgroungNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
}

