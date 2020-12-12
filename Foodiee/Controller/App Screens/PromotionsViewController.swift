//
//  PromotionsViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 17/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class PromotionsViewController: UIViewController {
    
    @IBOutlet weak var promotionsTableView: UITableView!
    var promotionsImages : [UIImage] = [UIImage]()
    @IBOutlet weak var totalNumberitems: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initlization()
    }
    func initlization() {
        removeBackgroungNavBar()
        setTableViewDelegate()
    }
    @IBAction func menuAction(_ sender: Any) {
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setNumberOfItems() {
        totalNumberitems.text = "Total \(promotionsImages.count) items"
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        setImages()
        setNumberOfItems()
    }
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
    func setImages()
    {
        promotionsImages.append(UIImage(named: "p1")!)
        promotionsImages.append(UIImage(named: "p2")!)
        promotionsImages.append(UIImage(named: "p3")!)
        promotionsImages.append(UIImage(named: "p4")!)
        
        promotionsImages.append(UIImage(named: "p1")!)
        promotionsImages.append(UIImage(named: "p2")!)
        promotionsImages.append(UIImage(named: "p3")!)
        promotionsImages.append(UIImage(named: "p4")!)
        
    }
    
}
extension PromotionsViewController: UITableViewDelegate , UITableViewDataSource {
    func setTableViewDelegate() {
        promotionsTableView.delegate = self
        promotionsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotionsImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionsTableViewCell", for: indexPath) as! PromotionsTableViewCell
        cell.setImage(image: promotionsImages[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
