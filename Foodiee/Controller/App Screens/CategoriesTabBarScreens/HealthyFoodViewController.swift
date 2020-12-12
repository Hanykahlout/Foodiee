//
//  HealthyFoodViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 15/10/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class HealthyFoodViewController: UIViewController {
    
    @IBOutlet weak var healthyCollectionView: UICollectionView!
    
//    var healthyInfo:[Meal] = [Meal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initlizaion()
    }
    func initlizaion(){
        setCollectionViewDelegate()
        setLayers()
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Healthy Food"
    }
    func setLayers(){
//        let layer = UICollectionViewFlowLayout()
//        layer.sectionInset = UIEdgeInsets(top: 0 , left: 50, bottom: 0, right: 50)
//        layer.minimumInteritemSpacing = 0
//        layer.minimumLineSpacing = 33
//        layer.scrollDirection = .vertical
//        layer.invalidateLayout()
//        
//        let x = CGFloat(healthyInfo.count) * layer.minimumLineSpacing
//        let size = self.view.frame.height / 2 - x
//        
//        layer.itemSize = CGSize(width: 135 , height: size)
//        healthyCollectionView.setCollectionViewLayout(layer, animated: true)
    }
}

extension HealthyFoodViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func setCollectionViewDelegate(){
        healthyCollectionView.delegate = self
        healthyCollectionView.dataSource = self
        registerCollectionViewCell()
    }
    func registerCollectionViewCell() {
        healthyCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0/*healthyInfo.count*/
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
//        cell.setInfo(meal: healthyInfo[indexPath.row])
        return cell
    }
}
