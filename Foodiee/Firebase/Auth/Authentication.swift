//
//  Authentication.swift
//  Foodiee
//
//  Created by macbook on 11/12/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD
import SCLAlertView
class Authentication {
    typealias CallBack =   (_ status:Bool) -> Void
    
    typealias CallBack1 =   (_ status:Bool,_ id:String) -> Void
    
    func signin(email:String,password:String,callBack:@escaping CallBack1) {
        SVProgressHUD.show(withStatus: "Signing in")
        Auth.auth().signIn(withEmail: email, password: password) { (data, error) in
            SVProgressHUD.dismiss()
            if error != nil{
                callBack(false,"")
                return
            }
            callBack(true,data!.user.uid)
        }
    }
    
    func signup(email:String,password:String,callBack:@escaping CallBack1) {
        SVProgressHUD.show(withStatus: "Signing up")
        Auth.auth().createUser(withEmail: email, password: password) { (data, error) in
            SVProgressHUD.dismiss()
            if let _ = error {
                callBack(false,"")
                return
            }
            callBack(true,data!.user.uid)
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
    
    func signInWithFacebook(token:String,callback: @escaping CallBack) {
        Auth.auth().signIn(withCustomToken: token) { (authResult, error) in
            if let error = error{
                callback(false)
            }
            callback(true)
        }
    }
}
