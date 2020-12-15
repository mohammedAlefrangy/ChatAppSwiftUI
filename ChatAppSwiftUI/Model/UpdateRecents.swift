//
//  UpdateRecents.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/14/20.
//

import Foundation
import Firebase


func updateRecents(uid: String,lastmsg: String,date: Date){
    
    let db = Firestore.firestore()
    
    let myuid = Auth.auth().currentUser?.uid
    
    db.collection("users").document(uid).collection("recents").document(myuid!).updateData(["lastmsg":lastmsg,"date":date])
    
     db.collection("users").document(myuid!).collection("recents").document(uid).updateData(["lastmsg":lastmsg,"date":date])
}
