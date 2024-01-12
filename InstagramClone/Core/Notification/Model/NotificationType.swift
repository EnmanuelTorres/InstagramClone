//
//  NotificationType.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import Foundation

enum NotificationType: Int, Codable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
            
        case .like:
            return "liked one of your posts."
        case .comment:
            return "commented one one of your posts."
        case .follow:
            return "started following you."
        }
    }
}
