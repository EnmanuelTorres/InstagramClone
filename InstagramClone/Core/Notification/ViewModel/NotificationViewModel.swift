//
//  NotificationViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import Foundation

class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init(){
        fetchNotifications()
    }
    
    func fetchNotifications(){
        self.notifications = DeveloperPreview.shared.notifications
    }
}
