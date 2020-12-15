//
//  SignInViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 13/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import SCLAlertView
class SignInViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: ButtonDesignable!
    
    @IBOutlet weak var emailTextField: BottomBorderTextField!
    @IBOutlet weak var passwordTextField: BottomBorderTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
    }
    func initlization(){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        editButtonFrame()
    }
    
    func editButtonFrame(){
        let image = UIImage(named: "Icon_i")
        getStartedButton.setImage(image, for: .normal)
        
        getStartedButton.tintColor = .white
        
        getStartedButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.imageView?.centerYAnchor.constraint(equalTo: getStartedButton.centerYAnchor, constant: 0.0).isActive = true
        getStartedButton.imageView?.trailingAnchor.constraint(equalTo: getStartedButton.trailingAnchor, constant: -31.8).isActive = true
    }
    
    @IBAction func getStartedAction(_ sender: Any) {
        performLogin()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SignInViewController {
    
    func performLogin() {
        if cheakData(){
            Authentication.init().signin(email: emailTextField.text!, password: passwordTextField.text!) { (status,id) in
                if status{
                    self.clear()
                    UserDefaultsData.init().save(id:id)
                    self.goToSecondNCView()
                }else{
                    SCLAlertView().showError("Error", subTitle: "There is invalid Data!!")
                }
            }
        }else{
            SCLAlertView().showError("Error", subTitle: "There is an Empty Fields !!")
        }
    }
    
    func goToSecondNCView() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NCView2") as! UINavigationController
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func cheakData() -> Bool {
        return !emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty
    }
    
    func clear() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
}
