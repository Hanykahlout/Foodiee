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
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        removeBackgroungNavBar()
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
            Authentication.init().signup(email: emailTextField.text!, password: passwordTextField.text!) { (status) in
                if status{
                    self.clear()
                    self.save()
                    self.goToSecondNC()
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
    
    func save(){
        let imageData = imageView.image!.pngData()!
        let imageString = imageData.base64EncodedString(options: .lineLength64Characters)
        UserDefaultsData.init().save(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, phoneNumber: phoneTextField.text!, address: addressTextField.text!, dateOfBirth: dateOfBirthTextField.text!, imageString: imageString)
        
        FFirestore.init().saveUserInfo(imageString: imageString, name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, phoneNumber: phoneTextField.text!, address: addressTextField.text!, dateOfBirth: dateOfBirthTextField.text!) { (status) in
            if status{
                print("Succefully Add To Firebase")
            }else{
                print("Falid Add To Firebase")
            }
        }
    }
    
    func clear() {
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        phoneTextField.text = ""
        addressTextField.text = ""
        dateOfBirthTextField.text = ""
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
        dismiss(animated: true, completion: nil)
    }
    
}
