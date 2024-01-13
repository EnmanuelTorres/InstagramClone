//
//  NotificationViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import Foundation

@MainActor
class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    private let service: NotificationService
    
    init(service: NotificationService){
        self.service = service
        Task{ await fetchNotifications() }
    }
    
    func fetchNotifications() async{
        do {
            self.notifications = try await service.fetchNotification()
            try await updateNotifications()
        } catch {
            print("DEBUG: Failed to fetch notifications with error: \(error.localizedDescription)")
        }
    }
    
    private func updateNotifications() async throws {
        for i in 0 ..< notifications.count {
            var notification = notifications[i]
            
            notification.user = try await UserService.fetchUser(withUid: notification.notificationSenderUid)
            
            if let postId = notification.postId {
                notification.post = try await PostService.fetchPost(postId)
            }
            
            notifications[i] = notification
        }
    }
}
