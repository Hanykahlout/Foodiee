//
//  ProductDetailViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 16/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController{
    
    
    @IBOutlet weak var mealName1: UILabel!
    
    @IBOutlet weak var mealName2: UILabel!
    
    @IBOutlet weak var rateNumber: UILabel!
    
    @IBOutlet var rateStars: [UIButton]!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var proteinLabel: UILabel!
    
    @IBOutlet weak var carbohydratesLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var reviewerTableView: UITableView!
    
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var contentOneView: UIView!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    @IBOutlet weak var popUpImage: UIImageViewDesignable!
        
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    
    func initlization() {
        removeBackgroungNavBar()
        setImageGradated()
        setTableViewDelegate()
        viewHeight.constant = (12 * 110)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func favoritesButtonAction(_ sender: Any) {
        favButton.image = UIImage(named: "myHert2")!
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buyNowAction(_ sender: Any) {
        self.contentOneView.frame = CGRect(x: 0, y: 400, width: self.contentOneView.bounds.width - 200, height: self.contentOneView.bounds.height - 200)
        UIView.animate(withDuration: 0.5) {
            self.contentOneView.frame = CGRect(x: 0, y: 0, width: self.contentOneView.bounds.width, height: self.contentOneView.bounds.height)
        }
        blackView.isHidden = false
        contentOneView.isHidden = false
    }
    
    @IBAction func exitButtonAction(_ sender: Any) {
        blackView.isHidden =  true
        contentOneView.isHidden = true
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderHistoryViewController") as! OrderHistoryViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setStarsRate(rate : Float){
        let rateNum = Int(rate)
        for i in 0...rateStars.count - 1 {
            if i < rateNum {
                rateStars[i].tintColor = .yellow
            }else{
                rateStars[i].tintColor = UIColor(named : "unSelectedStarsColor")
            }
        }
    }
    
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
    func setImageGradated() {
        let points = [GradientPoint(location: 0, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1547378229)), GradientPoint(location: 0.2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08379151221)), GradientPoint(location: 0.4, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2326315536)),
                  GradientPoint(location: 0.6, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4982341325)), GradientPoint(location: 0.8, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.85))]
        popUpImage.gradated(gradientPoints: points)
    }
}

extension ProductDetailViewController : UITableViewDelegate , UITableViewDataSource {
    
    func setTableViewDelegate(){
        reviewerTableView.delegate = self
        reviewerTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
        return cell
    }
}
