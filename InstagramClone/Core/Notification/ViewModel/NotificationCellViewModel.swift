//
//  NotificationCellViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 14/01/24.
//

import Foundation

@MainActor
class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
    }
    
    func follow(){
        Task {
            try await UserService.follow(uid: notification.notificationSenderUid)
            notification.user?.isFollowed = true
        }
    }
    
    func unfollow(){
        Task {
            try await UserService.unfollow(uid: notification.notificationSenderUid)
            notification.user?.isFollowed = false
            
        }
    }
    
}
