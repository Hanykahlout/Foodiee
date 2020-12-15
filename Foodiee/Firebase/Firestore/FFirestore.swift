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
    func saveMessage(hour:Int,minutes:Int,nanosecond:Int,text:String,sendback:@escaping sendBack) {
        FS.collection("Messages").addDocument(data: ["hour":hour,"minutes":minutes,"nanosecond":nanosecond,text:text]).addSnapshotListener { (snapshot, error) in
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
                let messages = snapshote?.documents.compactMap({ Message(hour: $0.data()["hour"] as! Int,
                                                                         minutes: $0.data()["minutes"] as! Int,
                                                                         nanosecond:$0.data()["nanosecond"] as! Int,
                                                                         text: $0.data()["text"] as! String,
                                                                         imageString: $0.data()["imageString"] as! String)
                })
                sendback(true,messages)
            }
        }
    }
    
    func saveUserInfo(id:String,name:String,email:String,password:String,phoneNumber:String,address:String,dateOfBirth:String,haveAnImage:Bool,sendback:@escaping sendBack) {
        FS.collection("UserInfo").addDocument(data: ["id":id,"name":name,"email":email,"password":password,"phoneNumber":phoneNumber,"address":address,"dateOfBirth":dateOfBirth,"Have_An_Image":haveAnImage]).addSnapshotListener { (snapshot, error) in
            if let _ = error{
                sendback(false)
            }else{
                sendback(true)
            }
        }
    }
    
    typealias sendBack3 = (_ status:Bool,_ user:UserInfo?) -> Void
    
    func getUserInfo(id:String,sendback:@escaping sendBack3) {
        FS.collection("UserInfo").getDocuments { (snapshote, error) in
            if let _ = error {
                sendback(false,nil)
            }else{
                var notFound = true
                for doc in snapshote!.documents {
                    if doc.data()["id"] as! String == id {
                        let user:UserInfo = UserInfo(id:id,name: doc.data()["name"] as! String, email: doc.data()["email"] as! String, password: doc.data()["password"] as! String , phoneNumber: doc.data()["phoneNumber"] as! String, address: doc.data()["address"] as! String, dateOfBirth: doc.data()["dateOfBirth"] as! String,haveAnImage: doc.data()["Have_An_Image"] as! Bool)
                        notFound = false
                        sendback(true,user)
                        break
                    }
                }
                if notFound{
                    sendback(false,nil)
                }
                
            }
        }
    }
}
