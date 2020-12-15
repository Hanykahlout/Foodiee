//
//  HomeViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 14/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pagerControl: UIPageControl!
    @IBOutlet weak var childView: UIView!
    var images = [UIImage]()
    
    @IBOutlet weak var MenuView: UIView!
    
    @IBOutlet weak var Address: UIButton!
    @IBOutlet weak var userImage: UIImageViewDesignable!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var mealsNameTableView: UITableView!
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var sliderChange: UIPageControl!
    
    @IBOutlet weak var hotDishesCollectionView: UICollectionView!
    
    @IBOutlet weak var moreHotDishesButton: UIButton!
    
    @IBOutlet weak var morePopularCategoriesButton: UIButton!
    
    @IBOutlet weak var bagNumberLabel: UILabelDesignable!
    
    var mealsNames : [FavouriteMealNameInfo] = [FavouriteMealNameInfo]()
    
    var viewGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    
    func initlization()  {
        setDelegates()
        setImageForButtons()
        setPageControls()
        setupTheOfferImagesSlider()
        setMealNames()
        setUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.MenuView.frame = CGRect(x: 0, y: -445, width: self.MenuView.bounds.width, height: self.MenuView.bounds.height)
    }
    
    func setUserInfo() {
        let userData = UserDefaultsData()
        FFirestore.init().getUserInfo(id: userData.getUserId()) { (status, user) in
            if status{
                self.userName.text = user!.name
                if !user!.haveAnImage{
                    self.userImage.image = UIImage(named:"download")!
                }else{
                    FStorage.init().downloadImage(id: userData.getUserId(), imageView: self.userImage)
                }
            }
        }
    }

    func setMealNames() {
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z1")!, selectedSignColor: UIColor(named: "Z1")!))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z2")!, selectedSignColor: .white))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z3")!, selectedSignColor: .white))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z4")!, selectedSignColor: .white))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z4")!, selectedSignColor: .white))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z4")!, selectedSignColor: .white))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z4")!, selectedSignColor: .white))
        mealsNames.append(FavouriteMealNameInfo(mealName: "HHHHH", mealNameColor: UIColor(named: "Z4")!, selectedSignColor: .white))
    }
    
    func setupTheOfferImagesSlider() {
        setImages()
        setDelegate()
        setScrollViewData()
        configurePageControl()
    }
    func setImages() {
        images.append(UIImage(named: "offerImage")!)
        images.append(UIImage(named: "offerImage")!)
        images.append(UIImage(named: "offerImage")!)
    }
    func setDelegate() {
        scrollView.delegate = self
    }
    func setScrollViewData() {
        var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
        for index in 0..<images.count {
            
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = images[index]
            
            let action = UITapGestureRecognizer(target: self, action: #selector(goToTheWebPage))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(action)
            
            scrollView.addSubview(imageView)
        }
        
        self.scrollView.isPagingEnabled = true
        self.scrollView.contentSize = CGSize(width:scrollView.frame.size.width * CGFloat(images.count),height: scrollView.frame.size.height)
    }
    
    @objc func goToTheWebPage(){
        
    }
    
    func configurePageControl() {
        pagerControl.numberOfPages = images.count
        pagerControl.currentPage = 0
        pagerControl.tintColor = UIColor(named: "L1")!
        pagerControl.pageIndicatorTintColor = UIColor(named: "ggg")!
        pagerControl.currentPageIndicatorTintColor = UIColor(named: "L1")!
        pagerControl.addTarget(self, action: #selector(self.changePage(sender:)), for: .valueChanged)
    }
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pagerControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    
    @IBAction func addressAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func settingsAction(_ sender: Any) {
    }
    
    @IBAction func searchAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductSearchViewController") as! ProductSearchViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func bagAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyBagViewController") as! MyBagViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
    
    @IBAction func MenuAction(_ sender: Any) {
        self.MenuView.frame = CGRect(x: 0, y: -490, width: self.MenuView.bounds.width, height: self.MenuView.bounds.height)
        UIView.animate(withDuration: 0.5) {
            self.MenuView.frame = CGRect(x: 0, y: 0, width: self.MenuView.bounds.width, height: self.MenuView.bounds.height)
            self.MenuView.isHidden = false
        }
        viewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideMenu))
        childView.addGestureRecognizer(viewGestureRecognizer)
        
    }
    @objc func hideMenu(){
        UIView.animate(withDuration: 0.5) {
            self.MenuView.frame = CGRect(x: 0, y: -490, width: self.MenuView.bounds.width, height: self.MenuView.bounds.height)
        }
        self.MenuView.isHidden = true
        childView.removeGestureRecognizer(viewGestureRecognizer)
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        let pc = sender as! UIPageControl
        imagesCollectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func moreHotDishesAction(_ sender: Any) {
        
    }
    
    @IBAction func morePopularCategoriesAction(_ sender: Any) {
        
    }
    
    @IBAction func healthyCategoryAction(_ sender: Any) {
        goToTabBarNC()
    }
    
    @IBAction func chineseCategoryAction(_ sender: Any) {
        goToTabBarNC()
    }
    @IBAction func dessertsCategoryAction(_ sender: Any) {
        goToTabBarNC()
    }
    
    @IBAction func cocktailsCategoryAction(_ sender: Any) {
        goToTabBarNC()
    }
    
    func goToTabBarNC(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarNC") as! UINavigationController
        
        present(vc, animated: true, completion: nil)
    }
    
    func setDelegates(){
        setCollectionViewDelegate()
        setTableViewDelegate()
    }
    func setImageForButtons(){
        addButtonImage()
        setMorebuttonImage(button: moreHotDishesButton)
        setMorebuttonImage(button: morePopularCategoriesButton)
    }
    func setPageControls(){
        sliderChange.numberOfPages = 8
    }
    
    func setMorebuttonImage(button:UIButton){
        
        let image = UIImage(named: "Icon material-navigate-next")
        
        button.setImage(image, for: .normal)
        
        button.tintColor = UIColor(named:"greenOne")
        
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        button.imageView?.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 0.0).isActive = true
        
        button.imageView?.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10).isActive = true
    }
    
    func addButtonImage() {
        let image = UIImage(named: "map1")
        
        Address.setImage(image, for: .normal)
        
        Address.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right:  0)
        
        Address.tintColor = UIColor(named:"MapColor")!
        
        Address.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        Address.imageView?.centerYAnchor.constraint(equalTo: Address.centerYAnchor, constant: 0.0).isActive = true
        
        Address.imageView?.leadingAnchor.constraint(equalTo: Address.leadingAnchor, constant: 0.0 ).isActive = true
    }
}
extension HomeViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout,UIScrollViewDelegate  {
    
    func setCollectionViewDelegate() {
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        hotDishesCollectionView.delegate = self
        hotDishesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imagesCollectionView {
            return 8
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imagesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagesCollectionViewCell", for: indexPath) as! imagesCollectionViewCell
            if indexPath.row == 1{
                cell.setData2()
            }else{
                cell.setData()
            }
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotDishesCollectionViewCell", for: indexPath) as! HotDishesCollectionViewCell
        cell.setCellInfo()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imagesCollectionView {
            return CGSize(width: imagesCollectionView.frame.width, height: imagesCollectionView.frame.height)
        }
        return CGSize(width: 160, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == imagesCollectionView {
            mealsNameTableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
            changeSelectedName(index: indexPath)
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contains(imagesCollectionView){
            sliderChange.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }else{
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pagerControl.currentPage = Int(pageNumber)
        }
    }
}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    func setTableViewDelegate() {
        mealsNameTableView.delegate = self
        mealsNameTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteMealTableViewCell", for: indexPath) as! FavouriteMealTableViewCell
        cell.setNames(name: mealsNames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeSelectedName(index:indexPath)
    }
    
    func changeSelectedName(index:IndexPath) {
        mealsNames[index.row].mealNameColor = UIColor(named:"Z1")!
        mealsNames[index.row].selectedSignColor = UIColor(named:"Z1")!
        imagesCollectionView.selectItem(at: index, animated: true, scrollPosition: .centeredHorizontally)
        sliderChange.currentPage = index.row
        let count = mealsNames.count
        var counter = 1
        while counter < count{
            if counter < 4 {
                mealsNames[(index.row + counter) % count].mealNameColor = UIColor(named:"Z\(counter + 1)")!
                mealsNames[(index.row + counter) % count].selectedSignColor = .white
            }else{
                mealsNames[(index.row + counter) % count].mealNameColor = UIColor(named:"Z4")!
                mealsNames[(index.row + counter) % count].selectedSignColor = .white
            }
            counter += 1
        }
        mealsNameTableView.reloadData()
    }
}
