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
    
    static let FollowingCollection = Root.collection("following")
    static let FollowersCollection = Root.collection("followers")
    
    static let NotificationCollection = Root.collection("notifications")
    
    static func UserNotificationCollection(uid: String) -> CollectionReference {
        return NotificationCollection.document(uid).collection("user-notifications")
    }
}
