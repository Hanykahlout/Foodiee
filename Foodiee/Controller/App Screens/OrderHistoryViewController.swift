//
//  OrderHistoryViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 17/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class OrderHistoryViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    @IBOutlet weak var totalNumberItems: UILabel!
    
    var historyCellInfo : [HistoryCellInfo] = [HistoryCellInfo] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    
    func initlization(){
        setTableViewDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        setData()
        setTotalItem()
    }
    
    @IBAction func bagButtonAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyBagViewController") as! MyBagViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyBagViewController") as! MyBagViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func setTotalItem(){
        totalNumberItems.text = "Total \(historyCellInfo.count) items"
        
    }
    
    func setData(){
        historyCellInfo.append(HistoryCellInfo(mealImage: UIImage(named:"Q1")!, mealName: "XXXXX", historyText: "xXXXX", mealPrice: "XXXXXX"))
        
        historyCellInfo.append(HistoryCellInfo(mealImage: UIImage(named:"Q1")!, mealName: "XXXXX", historyText: "xXXXX", mealPrice: "XXXXXX"))
        
        historyCellInfo.append(HistoryCellInfo(mealImage: UIImage(named:"Q1")!, mealName: "XXXXX", historyText: "xXXXX", mealPrice: "XXXXXX"))
        
        historyCellInfo.append(HistoryCellInfo(mealImage: UIImage(named:"Q1")!, mealName: "XXXXX", historyText: "xXXXX", mealPrice: "XXXXXX"))
        
        historyCellInfo.append(HistoryCellInfo(mealImage: UIImage(named:"Q1")!, mealName: "XXXXX", historyText: "xXXXX", mealPrice: "XXXXXX"))
        
        historyCellInfo.append(HistoryCellInfo(mealImage: UIImage(named:"Q1")!, mealName: "XXXXX", historyText: "xXXXX", mealPrice: "XXXXXX"))
    }
    
}
extension OrderHistoryViewController:UITableViewDelegate,UITableViewDataSource {
    func setTableViewDelegate() {
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyCellInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryMealTableViewCell", for: indexPath) as! HistoryMealTableViewCell
        cell.setData(historyCellInfo[indexPath.row])
        return cell
    }
}


