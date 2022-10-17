//
//  sendDB.swift
//  GoToPOM☆
//
//  Created by 石丸剣心 on 2022/10/14.
//

import Foundation
import FirebaseFirestore


class sendDB {
    
    var db = Firestore.firestore()
    
    var tenpoImage = String()
    var tenpoName = String()
    var tenpoGenre = String()
    
    
    init(tenpoImage: String, tenpoName: String, tenpoGenre: String) {
        
        self.tenpoImage = tenpoImage
        self.tenpoName = tenpoName
        self.tenpoGenre = tenpoGenre
        
    }
    
    func sendData() {
        
        self.db.collection("collection").document(self.tenpoName).setData(
        
            ["tenpoImage": self.tenpoImage as Any,
             "tenpoName": self.tenpoName as Any,
             "tenpoGenre": self.tenpoGenre as Any,
             "postDate": Date().timeIntervalSince1970])
        
    }
    
    
    
}
