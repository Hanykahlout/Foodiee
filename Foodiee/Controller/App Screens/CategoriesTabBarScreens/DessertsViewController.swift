//
//  DessertsViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 15/10/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class DessertsViewController: UIViewController {
    
    @IBOutlet weak var dessertsCollectionView: UICollectionView!
//    var dessertsInfo:[Meal] = [Meal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initlizaion()
        // Do any additional setup after loading the view.
    }
    func initlizaion(){
        setCollectionViewDelegate()
        setLayers()
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Desserts Food"
    }
    func setLayers(){
//        let layer = UICollectionViewFlowLayout()
//        layer.sectionInset = UIEdgeInsets(top: 0 , left: 50, bottom: 0, right: 50)
//        layer.minimumInteritemSpacing = 0
//        layer.minimumLineSpacing = 33
//        layer.scrollDirection = .vertical
//        layer.invalidateLayout()
//        
//        let x = CGFloat(dessertsInfo.count) * layer.minimumLineSpacing
//        let size = self.view.frame.height / 2 - x
//        
//        layer.itemSize = CGSize(width: 135 , height: size)
//        dessertsCollectionView.setCollectionViewLayout(layer, animated: true)
    }
}
extension DessertsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func setCollectionViewDelegate(){
        dessertsCollectionView.delegate = self
        dessertsCollectionView.dataSource = self
        registerCollectionViewCell()
    }
    func registerCollectionViewCell() {
        dessertsCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
//        cell.setInfo(meal: dessertsInfo[indexPath.row])
        return cell
    }
}
