//
//  ProductSearchViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 17/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ProductSearchViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var resultMealCollectionView: UICollectionView!
    var searchCellInfo:[SearchCellInfo] = [SearchCellInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    
    func initlization(){
        setTextFieldImage()
        setCollectionViewDelegate()
        removeBackgroungNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setMeatData()
        setLayers()
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func menoButtonAction(_ sender: Any) {
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
    func setTextFieldImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: "Icon feather-search")!
        searchTextField.rightViewMode = UITextField.ViewMode.always
        searchTextField.rightView = imageView
//for add action to search image view when the user click on it
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
            print("Hello World")
    }
    
    func setMeatData() {
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q1")!, mealName: "Italian Meals", totalItemText: "Total 27 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q2")!, mealName: "Chinese Meals", totalItemText: "Total 45 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q4")!, mealName: "Asian Meals", totalItemText: "Total 12 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q3")!, mealName: "Healthy Meals", totalItemText: "Total 31 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q5")!, mealName: "Fast Food", totalItemText: "Total 95 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q6")!, mealName: "Desserts", totalItemText: "Total 113 items"))
        //-----------------------------------------------------------------
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q1")!, mealName: "Italian Meals", totalItemText: "Total 27 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q2")!, mealName: "Chinese Meals", totalItemText: "Total 45 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q4")!, mealName: "Asian Meals", totalItemText: "Total 12 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q3")!, mealName: "Healthy Meals", totalItemText: "Total 31 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q5")!, mealName: "Fast Food", totalItemText: "Total 95 items"))
        
        searchCellInfo.append(SearchCellInfo(image: UIImage(named: "Q6")!, mealName: "Desserts", totalItemText: "Total 113 items"))
    }
    func setLayers(){
        let layer = UICollectionViewFlowLayout()
        layer.sectionInset = UIEdgeInsets(top: 0 , left: 30, bottom: 0, right: 45)
        layer.minimumInteritemSpacing = 20
        layer.minimumLineSpacing = 10
        layer.scrollDirection = .vertical
        layer.invalidateLayout()
        let x = layer.minimumInteritemSpacing * CGFloat(searchCellInfo.count)
        let size = self.view.frame.height / 2 -  x + 10
        
        layer.itemSize = CGSize(width: 123, height: size)
        resultMealCollectionView.setCollectionViewLayout(layer, animated: true)
    }
}

extension ProductSearchViewController:UICollectionViewDelegate , UICollectionViewDataSource{
    
    func setCollectionViewDelegate() {
        resultMealCollectionView.delegate = self
        resultMealCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchCellInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.setData(searchCellInfo[indexPath.row])
        return cell
    }
}
