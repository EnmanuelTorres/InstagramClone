//
//  Post.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 18/12/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUID: String
    let caption: String
    var likes : Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    var didLike: Bool? = false
}

extension Post {
    
    static let MOCK_IMAGE_URL = "https://firebasestorage.googleapis.com/v0/b/instagramclone-5e74a.appspot.com/o/profile_images%2F47ECD2C8-7704-42B9-8D3A-602F406B4D10?alt=media&token=26bd3ae1-b47a-4764-9354-0f05f2878ef7"
    
    
    static var MOCK_POSTS: [Post] = [
        
        .init(
              id: NSUUID().uuidString,
              ownerUID: NSUUID().uuidString,
              caption: "The cream I use makes miracles on me",
              likes: 567,
              imageUrl: MOCK_IMAGE_URL,
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]
             ),
        
            .init(
                  id: NSUUID().uuidString,
                  ownerUID: NSUUID().uuidString,
                  caption: "I'd not go anywhere with you",
                  likes: 1000,
                  imageUrl: "arnulfoBriceno",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[1]
                 ),
        
            .init(
                  id: NSUUID().uuidString,
                  ownerUID: NSUUID().uuidString,
                  caption: "God is good and he blessed me",
                  likes: 275,
                  imageUrl: "luisSilva",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[2]
                 ),
        
            .init(
                  id: NSUUID().uuidString,
                  ownerUID: NSUUID().uuidString,
                  caption: "I love the plain, the river and you",
                  likes: 3124,
                  imageUrl: "viticoCastillo",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[3]
                 ),
        .init(
              id: NSUUID().uuidString,
              ownerUID: NSUUID().uuidString,
              caption: "No one is like you",
              likes: 57,
              imageUrl: "armandoMartinez",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4]
             )
    ]
}
