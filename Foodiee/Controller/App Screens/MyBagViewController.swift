//
//  MyBagViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 20/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class MyBagViewController: UIViewController {
    
    @IBOutlet weak var myBagTableView: UITableView!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    var myBag: [BagInfo] = [BagInfo]()
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    @IBOutlet weak var numberOfItemInBagLabel: UILabelDesignable!
    
    @IBOutlet weak var ourAlertView: ViewDesignable!
    var blurVisualEffectView: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        setData()
        changeTotalPrice()
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func nextAction(_ sender: Any) {
        showAlertAction()
    }
    func setTotalPrice() {
        var price:Int = 0
        for meal in myBag {
            price += Int(meal.mealNumber)!
        }
    }
    @IBAction func thanksAction(_ sender: Any) {
        ourAlertView.isHidden = true
        blurVisualEffectView.removeFromSuperview()
        let vc = storyboard?.instantiateViewController(withIdentifier: "DeliveryStatusViewController") as! DeliveryStatusViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlertAction() {
        addBlurrView()
        ourAlertView.backgroundColor = .white
        ourAlertView.isHidden = false
        view.addSubview(ourAlertView)
    }
    
    func addBlurrView() {
        let blurEffect = UIBlurEffect(style: .dark)
        blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurVisualEffectView.frame = view.frame
        view.addSubview(blurVisualEffectView)
    }
    
    func initlization(){
        setTableViewDelegate()
    }
    
    func setData(){
        myBag.append(BagInfo(mealImage: UIImage(named: "S1")!, mealName: "askdljsad", mealPrice: "30", mealNumber: "1"))
        myBag.append(BagInfo(mealImage: UIImage(named: "S1")!, mealName: "askdljsad", mealPrice: "30", mealNumber: "1"))
        myBag.append(BagInfo(mealImage: UIImage(named: "S1")!, mealName: "askdljsad", mealPrice: "30", mealNumber: "1"))
        myBag.append(BagInfo(mealImage: UIImage(named: "S1")!, mealName: "askdljsad", mealPrice: "30", mealNumber: "1"))
        myBag.append(BagInfo(mealImage: UIImage(named: "S1")!, mealName: "askdljsad", mealPrice: "30", mealNumber: "1"))
        myBag.append(BagInfo(mealImage: UIImage(named: "S1")!, mealName: "askdljsad", mealPrice: "30", mealNumber: "1"))
        setNumberOfMeals()
    }
    func setNumberOfMeals(){
        numberOfItemsLabel.text = "Total \(myBag.count) items"
        numberOfItemInBagLabel.text = "\(myBag.count)"
    }
    func changeTotalPrice() {
        var totalPrice = 0
        for meal in myBag{
            totalPrice += (Int(meal.mealNumber)! * Int(meal.mealPrice)!)
        }
        totalPriceLabel.text = String(totalPrice)
    }
}
extension MyBagViewController : UITableViewDelegate , UITableViewDataSource {
    func setTableViewDelegate(){
        myBagTableView.delegate = self
        myBagTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBag.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyBagTableViewCell", for: indexPath) as! MyBagTableViewCell
        cell.delegate = self
        cell.setData(data: myBag[indexPath.row],index:indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            myBag.remove(at: indexPath.row)
            myBagTableView.deleteRows(at: [indexPath], with: .automatic)
            changeTotalPrice()
            setNumberOfMeals()
        }
    }
}

extension MyBagViewController : changeDelegate{
    func changeNumberOfMeal(index: IndexPath,number:String) {
        myBag[index.row].mealNumber = number
        changeTotalPrice() 
    }
}
