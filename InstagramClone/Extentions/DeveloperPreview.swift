//
//  DeveloperPreview.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import SwiftUI
import Firebase


struct DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOwnerUid: "123",
                          commentText: "Test comment for now",
                          postId: "34456",
                          timeStamp: Timestamp(),
                          commentOwnerUid: "27337939")
    
    let notifications: [Notification] = [
        .init(id: NSUUID().uuidString,
              timestamp: Timestamp(),
              notificationSenderUid: "123",
              type: .like),
        
        .init(id: NSUUID().uuidString,
              timestamp: Timestamp(),
              notificationSenderUid: "465",
              type: .comment),
        
        .init(id: NSUUID().uuidString,
              timestamp: Timestamp(),
              notificationSenderUid: "495",
              type: .follow),
        
        .init(id: NSUUID().uuidString,
              timestamp: Timestamp(),
              notificationSenderUid: "351",
              type: .like),
        
            .init(id: NSUUID().uuidString,
                  timestamp: Timestamp(),
                  notificationSenderUid: "849",
                  type: .like)
    ]
}
