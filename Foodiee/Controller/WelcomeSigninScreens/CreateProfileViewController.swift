//
//  CreateProfileViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 14/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import SCLAlertView
class CreateProfileViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: BottomBorderTextField!
    @IBOutlet weak var imageView: UIImageViewDesignable!
    @IBOutlet weak var nameTextField: BottomBorderTextField!
    @IBOutlet weak var emailTextField: BottomBorderTextField!
    @IBOutlet weak var phoneTextField: BottomBorderTextField!
    @IBOutlet weak var addressTextField: BottomBorderTextField!
    @IBOutlet weak var dateOfBirthTextField: BottomBorderTextField!
    var imageURL:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeBackgroungNavBar()
        imageURL = URL(fileURLWithPath: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func doneAction(_ sender: Any) {
        performCreatingUser()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func captureAction(_ sender: Any) {
        showAlertOptions()
    }
    
    func showAlertOptions() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let profilePickerAction = UIAlertAction(title: "Choose From library", style: .default) { (action) in
            self.setImageBy(source:.photoLibrary)
        }
        
        let cameraAction = UIAlertAction(title: "Take A Photo By Camera", style: .default) { (action) in
            self.setImageBy(source:.camera)
        }
        
        let deleteAction = UIAlertAction(title: "Delete A Photo", style: .destructive) { (action) in
            self.imageView.image = UIImage(named: "download")!
        }
        
        let AlertViewer = UIAlertController(title: "Choose Profile Photo", message: nil, preferredStyle: .actionSheet)
        AlertViewer.addAction(profilePickerAction)
        AlertViewer.addAction(cameraAction)
        AlertViewer.addAction(deleteAction)
        AlertViewer.addAction(cancelAction)
        present(AlertViewer, animated: true, completion: nil)
    }
    
    func removeBackgroungNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
}

extension CreateProfileViewController {
    func performCreatingUser() {
        if cheackData(){
                Authentication.init().signup(email: emailTextField.text!, password: passwordTextField.text!) { (status,id)  in
                    if status{
                        self.save(id:id)
                    }else{
                        SCLAlertView().showError("Error", subTitle: "There is Invalid Data !!")
                    }
                }
        }else{
            SCLAlertView().showError("Error", subTitle: "There is an Empty Fields !!")
        }
    }
    
    func cheackData() -> Bool {
        return !nameTextField.text!.isEmpty &&
            !emailTextField.text!.isEmpty &&
            !passwordTextField.text!.isEmpty &&
            !addressTextField.text!.isEmpty &&
            !dateOfBirthTextField.text!.isEmpty &&
            !phoneTextField.text!.isEmpty
    }
    
    func goToSecondNC() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NCView2") as! UINavigationController
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func save(id:String){
        UserDefaultsData.init().save(id: id)
        FStorage.init().uploadImage(id: id, imageURL: imageURL) { (status) in
        if status{
            self.saveTheUserInFirebase(id:id,haveAnImage:true)
        }else{
            self.saveTheUserInFirebase(id:id,haveAnImage:false)
        }}
    }
    
    func clear() {
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        phoneTextField.text = ""
        addressTextField.text = ""
        dateOfBirthTextField.text = ""
    }
    func saveTheUserInFirebase(id:String,haveAnImage:Bool) {
        FFirestore.init().saveUserInfo(id:id, name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, phoneNumber: phoneTextField.text!, address: addressTextField.text!, dateOfBirth: dateOfBirthTextField.text!,haveAnImage: haveAnImage) { (status) in
            if status{
                self.clear()
                self.goToSecondNC()
            }else{
                SCLAlertView().showError("Error", subTitle: "Falid Add To Firebase")
            }
        }
    }
}

extension CreateProfileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func setImageBy(source:UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = source
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editingImage
        }else if let orginalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = orginalImage
        }
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            imageURL = url
        }
        dismiss(animated: true, completion: nil)
    }
    
}
