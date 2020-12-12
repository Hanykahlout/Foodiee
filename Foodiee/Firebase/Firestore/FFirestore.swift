//
//  FFirestore.swift
//  Foodiee
//
//  Created by macbook on 11/12/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import Foundation
import Firebase

class FFirestore  {
    
    typealias sendBack = (_ status:Bool) -> Void
    
    let FS = Firestore.firestore()
    
    func saveMessage(text:String,time:String,imageString:String,sendback:@escaping sendBack) {
        FS.collection("Messages").addDocument(data: ["text":text,"time":time,"imageString":imageString]).addSnapshotListener { (snapshot, error) in
            if let _ = error{
                sendback(false)
            }else{
                sendback(true)
            }
        }
    }
    
    typealias sendBack2 = (_ status:Bool,_ data:[Message]?) -> Void
    
    func getMessages(sendback:@escaping sendBack2) {
        FS.collection("Messages").getDocuments { (snapshote, error) in
            if let _ = error {
                sendback(false,nil)
            }else{
                let messages = snapshote?.documents.compactMap({ Message(text: $0.data()["text"] as! String,
                                                                         time: $0.data()["time"] as! String,
                                                                         imageString: $0.data()["imageString"] as! String)
                })
                sendback(true,messages)
            }
        }
    }
    
    func saveUserInfo(imageString:String,name:String,email:String,password:String,phoneNumber:String,address:String,dateOfBirth:String,sendback:@escaping sendBack) {
        FS.collection("UserInfo").addDocument(data: ["imageString":imageString,"name":name,"email":email,"password":password,"phoneNumber":phoneNumber,"address":address,"dateOfBirth":dateOfBirth]).addSnapshotListener { (snapshot, error) in
            if let _ = error{
                sendback(false)
            }else{
                sendback(true)
            }
        }
    }
    
    typealias sendBack3 = (_ status:Bool,_ data:[UserInfo]?) -> Void
    
    func getUserInfo(sendback:@escaping sendBack3) {
        FS.collection("UserInfo").getDocuments { (snapshote, error) in
            if let _ = error {
                sendback(false,nil)
            }else{
                let userInfo = snapshote?.documents.compactMap({
                    UserInfo(imageString: $0.data()["imageString"] as! String, name: $0.data()["name"] as! String, email: $0.data()["email"] as! String,password: $0.data()["password"] as! String,phoneNumber: $0.data()["phoneNumber"] as! String, address: $0.data()["address"] as! String, dateOfBirth: $0.data()["dateOfBirth"] as! String)
                })
                sendback(true,userInfo)
            }
        }
    }
}
