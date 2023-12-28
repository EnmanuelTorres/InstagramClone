//
//  UserService.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 22/12/23.
//

import Foundation
import Firebase


struct UserService {
    
    static func fetchUser(withUid uid: String) async throws ->  User {
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return  try snapshot.data(as: User.self)
    }
  
   static func fetchAllUser() async throws -> [User] {
     let snapshot = try await Firestore.firestore().collection("users").getDocuments()
       return snapshot.documents.compactMap{ try? $0.data(as: User.self) }
    }
    
    
}
