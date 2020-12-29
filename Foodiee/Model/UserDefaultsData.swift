//
//  UserDefaultsData.swift
//  Foodiee
//
//  Created by macbook on 12/12/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
class UserDefaultsData {
    private let ID = "id"
    private let No_Image = "NoImage"
    
    func save(id:String) {
        UserDefaults.standard.setValue(id, forKey: ID)
    }
    func getUserId() -> String {
        return UserDefaults.standard.string(forKey: ID) ?? ""
    }
    func setAsNoImage() {
        UserDefaults.standard.setValue(true, forKey: No_Image)
    }
    func isItNoImage() -> Bool {
        return UserDefaults.standard.bool(forKey: No_Image)
    }
    func clear() {
        UserDefaults.standard.removeObject(forKey: ID)
        UserDefaults.standard.removeObject(forKey: No_Image)
    }
}
