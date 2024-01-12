//
//  Notification.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import Firebase

struct Notification: Identifiable, Codable {
    var id: String
    var postId: String?
    let timestamp: Timestamp
    let notificationSenderUid: String
    let type: NotificationType
    
    var post: Post?
    var user: User?
}
