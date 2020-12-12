//
//  FavoritesViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 18/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    var favoritesInfo:[FavoritesInfo] = [FavoritesInfo] ()
    
    @IBOutlet weak var sortingButtonsCollectionView: UICollectionView!
    
    var buttonDetails:[ButtonDetails] = [ButtonDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    
    func initlization() {
        removeBackgroungNavBar()
        setCollectionViewDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        setData()
        setLayers()
        setSortingButtons()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func setLayers(){
        
        let layer = UICollectionViewFlowLayout()
        layer.sectionInset = UIEdgeInsets(top: 0 , left: 50, bottom: 0, right: 50)
        layer.minimumInteritemSpacing = 50
        layer.minimumLineSpacing = 35
        layer.scrollDirection = .vertical
        layer.invalidateLayout()
        
        let x = CGFloat(favoritesInfo.count) * layer.minimumLineSpacing
        let size = (favoritesCollectionView.frame.height / CGFloat(favoritesInfo.count)) + (x/2)

        layer.itemSize = CGSize(width: 120 , height: size)
        favoritesCollectionView.setCollectionViewLayout(layer, animated: true)

    }
    
    func setData() {
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "3.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "1.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "4.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "2.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "3.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "1.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "4.0"))
        
        favoritesInfo.append(FavoritesInfo(image: UIImage(named: "Q1")!, mealName: "ldskjhfklsdf", rateNumber: "2.0"))
        
    }
    
    func setSortingButtons() {
        buttonDetails.append(ButtonDetails(buttonName: "All", BGColor: UIColor(named:"L1")!, textColor: .white, isDropDownList: false, buttonWidth: 78))
        
        buttonDetails.append(ButtonDetails(buttonName: "Type of meal", BGColor: UIColor(named:"L2")!, textColor: UIColor(named:"L3")!, isDropDownList: true, buttonWidth: 120))
        
        buttonDetails.append(ButtonDetails(buttonName: "Price Range", BGColor: UIColor(named:"L2")!, textColor: UIColor(named:"L3")!, isDropDownList: true, buttonWidth: 120))
      
        buttonDetails.append(ButtonDetails(buttonName: "XXX", BGColor: UIColor(named:"L2")!, textColor: UIColor(named:"L3")!, isDropDownList: true, buttonWidth: 120))
    }
}
extension FavoritesViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func setCollectionViewDelegate(){
        
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        sortingButtonsCollectionView.dataSource = self
        sortingButtonsCollectionView.delegate = self
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == favoritesCollectionView{
            return favoritesInfo.count
        }
        return buttonDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == favoritesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath) as! FavoritesCollectionViewCell
            cell.setInfo(info:favoritesInfo[indexPath.row])
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesSortButtonsCollectionViewCell", for: indexPath) as! FavoritesSortButtonsCollectionViewCell
        cell.setButtonDetailes(buttonDetails[indexPath.row])
       return cell
    }
}

