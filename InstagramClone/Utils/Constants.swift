//
//  Constants.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 7/01/24.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
    
    static let PostsCollection = Root.collection("posts")
}
