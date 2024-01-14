//
//  NotificationManager.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 12/01/24.
//

import Foundation

class NotificationManager {
    
    static let shared = NotificationManager()
    private let service = NotificationService()
    
    
    private init(){}
    
    func uploadLikeNotification(toUid uid: String, post: Post) {
        service.uploadNotification(toUid: uid, type: .like, post: post)
    }
    
    func uploadCommentNotification(toUid uid: String, post: Post) {
        service.uploadNotification(toUid: uid, type: .comment, post: post)
    }
    
    func uploadFollowNotification(toUid uid: String) {
        service.uploadNotification(toUid: uid, type: .follow)
    }
    
    func deleteNotification(toUid uid: String, type: NotificationType, postId: String? = nil) async{
        try? await service.deleteNotification(toUid: uid, type: type, postId: postId)
    }
}
