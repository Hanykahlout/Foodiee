//
//  DropDownStaticTableViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 27/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import SCLAlertView
class DropDownStaticTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "CCDetailsViewController") as! CCDetailsViewController
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("Help")
            break
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "PromotionsViewController") as! PromotionsViewController
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            logout()
        default:
            break
        }
    }
    
    func logout() {
        Authentication.init().signOut { (status) in
            if status{
                UserDefaultsData.init().clear()
                let window = UIApplication.shared.windows.first
                let firestNC = self.storyboard!.instantiateViewController(withIdentifier: "NCView") as! UINavigationController
                window?.rootViewController = firestNC
                UserDefaults.standard.setValue("firestNC", forKey: "root")
                window?.makeKeyAndVisible()
            }else{
                SCLAlertView().showError("Error", subTitle: "There is Some Error for logout process")
            }
        }
    }
    func goToLoginScreen()  {
        let root = UserDefaults.standard.string(forKey: "root")
        if root == "firestNC" || root == "welcomeScreens"{
            navigationController?.dismiss(animated: true, completion: nil)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
