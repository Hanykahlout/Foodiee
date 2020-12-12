//
//  Authentication.swift
//  Foodiee
//
//  Created by macbook on 11/12/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import FirebaseAuth

class Authentication {
    typealias CallBack =   (_ status:Bool) -> Void
    func signin(email:String,password:String,callBack:@escaping CallBack) {
        Auth.auth().signIn(withEmail: email, password: password) { (data, error) in
            if let _error = error{
                callBack(false)
                return
            }
            callBack(true)
        }
    }
    
    func signup(email:String,password:String,callBack:@escaping CallBack) {
        Auth.auth().createUser(withEmail: email, password: password) { (data, error) in
            if let _ = error {
                callBack(false)
                return
            }
            callBack(true)
        }
    }
    
    func isLoggedin() -> Bool {
        if let _ = Auth.auth().currentUser{
            return true
        }
        return false
    }
    
    func signOut(callBack:@escaping CallBack) {
        do{
            try Auth.auth().signOut()
            callBack(true)
        }catch _ as Error{
            callBack(false)
        }
    }
    
}
