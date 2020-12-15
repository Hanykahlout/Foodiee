//
//  Storage.swift
//  Foodiee
//
//  Created by macbook on 14/12/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import Photos
import Firebase
import FirebaseStorage
import FirebaseUI

class FStorage{
    let storageRef = Storage.storage().reference()
    typealias CallBack = (_ status:Bool) -> Void
    
    func uploadImage(id:String,imageURL:URL,callBack:@escaping CallBack) {
        let imagesRef = storageRef.child("\(id)/images")
        imagesRef.putFile(from: imageURL, metadata: nil) { (metaData, error) in
            if let _ = error{
                callBack(false)
            }else{
                callBack(true)
            }
        }
    }
    
    func downloadImage(id:String,imageView:UIImageView) {
        let imageRef = storageRef.child("\(id)/images")
        imageView.sd_setImage(with: imageRef)
    }
}
