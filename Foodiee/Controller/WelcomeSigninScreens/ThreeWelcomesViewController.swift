//
//  ThreeWelcomesViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 13/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ThreeWelcomesViewController: UIViewController {
    
    
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var isGo:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    func initlization(){
        setDelegate()
    }
    
    @IBAction func skipAction(_ sender: Any) {
        getToWelcomeScreen()	
    }
}

extension ThreeWelcomesViewController :UIScrollViewDelegate{
    func setDelegate() {
        scrolView.delegate = self
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrolView.contentOffset.x/375)
        if pageControl.currentPage == 3 {
            if !isGo{
                getToWelcomeScreen()
                isGo = true
            }
        }
    }
    
    func getToWelcomeScreen() {
        performSegue(withIdentifier: "NCView", sender: nil)
    }
}
