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
    private var currentUser: User?
    
    init(service: NotificationService){
        self.service = service
        Task{ await fetchNotifications() }
        self.currentUser = UserService.shared.currentUser
    }
    
    func fetchNotifications() async{
        do {
            self.notifications = try await service.fetchNotification()
          //  try await updateNotifications()
            await withThrowingTaskGroup(of: Void.self) { group in
            
                    group.addTask {
                        try await self.updateNotifications()

                }
            }
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
                notification.post?.user = self.currentUser
            }
            
           
            if notification.type == .follow {
                let localNotification = notification
                async let isFollowed = try await UserService.checkIfUserIsFollowed(uid: localNotification.notificationSenderUid)
                notification.user?.isFollowed = try await isFollowed
            }
        
            
            
          notifications[i] = notification
        
        }
    }
}
