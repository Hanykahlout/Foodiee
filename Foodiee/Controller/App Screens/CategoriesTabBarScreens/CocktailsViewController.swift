//
//  CocktailsViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 15/10/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class CocktailsViewController: UIViewController {
    
    @IBOutlet weak var cocktailsCollectionView: UICollectionView!
//    var cocktailsInfo: [Meal] = [Meal]()
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
        tabBarController?.navigationItem.title = "Cocktails Food"
    }
    
    func setLayers(){
//        let layer = UICollectionViewFlowLayout()
//        layer.sectionInset = UIEdgeInsets(top: 0 , left: 50, bottom: 0, right: 50)
//        layer.minimumInteritemSpacing = 0
//        layer.minimumLineSpacing = 33
//        layer.scrollDirection = .vertical
//        layer.invalidateLayout()
//
//        let x = CGFloat(cocktailsInfo.count) * layer.minimumLineSpacing
//        let size = self.view.frame.height / 2 - x
//
//        layer.itemSize = CGSize(width: 135 , height: size)
//        cocktailsCollectionView.setCollectionViewLayout(layer, animated: true)
    }
}

extension CocktailsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func setCollectionViewDelegate(){
        cocktailsCollectionView.delegate = self
        cocktailsCollectionView.dataSource = self
        registerCollectionViewCell()
    }
    
    func registerCollectionViewCell() {
        cocktailsCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0 /*cocktailsInfo.count*/
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
//        cell.setInfo(meal: cocktailsInfo[indexPath.row])
        return cell
    }
    
}
