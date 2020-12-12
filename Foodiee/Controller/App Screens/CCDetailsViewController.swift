//
//  CCDetailsViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 21/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class CCDetailsViewController: UIViewController {
    
    @IBOutlet weak var firstCardNumber: UILabel!
    @IBOutlet weak var secondCardNumber: UILabel!
    @IBOutlet weak var firstCardName: UILabel!
    @IBOutlet weak var secondCardName: UILabel!
    @IBOutlet weak var firstCardDate: UILabel!
    @IBOutlet weak var secondCardDate: UILabel!
    @IBOutlet weak var ourScrollView: UIScrollView!
    @IBOutlet weak var pageC: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()

    }
    func initlization(){
        removeBackgroungNavBar()
        ourScrollView.delegate = self
        pageC.numberOfPages = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func saveAction(_ sender: Any) {
        
    }
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
}

extension CCDetailsViewController :UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageC.currentPage = Int(scrollView.contentOffset.x/375)
    }
}
