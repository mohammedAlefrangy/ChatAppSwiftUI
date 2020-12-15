//
//  Functions.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/13/20.
//

import Foundation
import Firebase
import FirebaseFirestore

class Functions {
    
    
    
    func CreateUser(name: String,about : String,imagedata : Data,completion : @escaping (Bool)-> Void){
        
        // save all data for user name & about
        let db = Firestore.firestore()
        
        // save the photo for user
        let storage = Storage.storage().reference()
        
        let uid = Auth.auth().currentUser?.uid
        
        storage.child("profilepics").child(uid!).putData(imagedata, metadata: nil) { (_, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            storage.child("profilepics").child(uid!).downloadURL { (url, err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                db.collection("users").document(uid!).setData(["name":name,"about":about,"pic":"\(url!)","uid":uid!]) { (err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                    
                    completion(true)
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    UserDefaults.standard.set(name, forKey: "UserName")
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    
                }
            }
        }
    }
    
    
}
