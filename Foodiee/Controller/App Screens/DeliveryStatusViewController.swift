//
//  DeliveryStatusViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 21/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class DeliveryStatusViewController: UIViewController {

    @IBOutlet weak var trackingButton: ButtonDesignable!
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
        // Do any additional setup after loading the view.
    }
    func initlization(){
        removeBackgroungNavBar()
        editButtonFrame()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    func removeBackgroungNavBar(){
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.layoutIfNeeded()
       }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func trackingAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func editButtonFrame(){

       trackingButton.titleEdgeInsets = UIEdgeInsets(top: 8 ,left: 9,bottom: 8,right: 30)

       let image = UIImage(named: "XXX")
       trackingButton.setImage(image, for: .normal)

       trackingButton.tintColor = .white

       trackingButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
       trackingButton.imageView?.centerYAnchor.constraint(equalTo: trackingButton.centerYAnchor, constant: 0.0).isActive = true
       trackingButton.imageView?.trailingAnchor.constraint(equalTo: trackingButton.trailingAnchor, constant: -8).isActive = true
    }
    
}
