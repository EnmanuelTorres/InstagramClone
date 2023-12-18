//
//  Post.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 18/12/23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUID: String
    let caption: String
    var likes : Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        
        .init(
              id: NSUUID().uuidString,
              ownerUID: NSUUID().uuidString,
              caption: "The cream I use makes miracles on me",
              likes: 567,
              imageUrl: "reynaldoArmas",
              timestamp: Date(),
              user: User.MOCK_USERS[0]
             ),
        
            .init(
                  id: NSUUID().uuidString,
                  ownerUID: NSUUID().uuidString,
                  caption: "I'd not go anywhere with you",
                  likes: 1000,
                  imageUrl: "arnulfoBriceno",
                  timestamp: Date(),
                  user: User.MOCK_USERS[1]
                 ),
        
            .init(
                  id: NSUUID().uuidString,
                  ownerUID: NSUUID().uuidString,
                  caption: "God is goodand he blessed me",
                  likes: 275,
                  imageUrl: "luisSilva",
                  timestamp: Date(),
                  user: User.MOCK_USERS[2]
                 ),
        
            .init(
                  id: NSUUID().uuidString,
                  ownerUID: NSUUID().uuidString,
                  caption: "I love the plain, the river and you",
                  likes: 3124,
                  imageUrl: "viticoCastillo",
                  timestamp: Date(),
                  user: User.MOCK_USERS[3]
                 ),
        .init(
              id: NSUUID().uuidString,
              ownerUID: NSUUID().uuidString,
              caption: "No one is like you",
              likes: 57,
              imageUrl: "armandoMartinez",
              timestamp: Date(),
              user: User.MOCK_USERS[4]
             )
    ]
}
