//
//  UserDefaultsData.swift
//  Foodiee
//
//  Created by macbook on 12/12/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
class UserDefaultsData {
    
    private let NAME = "name"
    private let EMAIL = "email"
    private let PASSWORD = "password"
    private let PHONE_NUMBER = "phoneNumber"
    private let ADDRESS = "address"
    private let DATE_OF_BIRTH = "dataOfBirth"
    private let IMAGE_STRING = "imageString"
    
    func save(name:String,email:String,password:String,phoneNumber:String,address:String,dateOfBirth:String,imageString:String) {
        UserDefaults.standard.setValue(name, forKey: NAME)
        UserDefaults.standard.setValue(email, forKey: EMAIL)
        UserDefaults.standard.setValue(password, forKey: PASSWORD)
        UserDefaults.standard.setValue(phoneNumber, forKey: PHONE_NUMBER)
        UserDefaults.standard.setValue(address, forKey: ADDRESS)
        UserDefaults.standard.setValue(dateOfBirth, forKey: DATE_OF_BIRTH)
        UserDefaults.standard.setValue(imageString, forKey: IMAGE_STRING)
    }
    
    func getUserImage() -> UIImage {
        let imageString = UserDefaults.standard.string(forKey: IMAGE_STRING)!
        let imageData = Data(base64Encoded: imageString, options: .ignoreUnknownCharacters)!
        let image = UIImage(data: imageData as Data)!
        return image
    }
    
    func getUserName() -> String {
        return UserDefaults.standard.string(forKey: NAME)!
    }
    
}
