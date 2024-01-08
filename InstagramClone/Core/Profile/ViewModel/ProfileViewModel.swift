//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 7/01/24.
//

import Foundation

@MainActor
class ProfileViewModel : ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserStats()
    }
    
    func fetchUserStats(){
        Task {
            self.user.stats = try await UserService.fetchUserStats(uid: user.id)
        }
    }
}

// MARK: - Following

extension ProfileViewModel {
    func follow(){
        
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
        }
    }
    
    func unfollow(){
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed(){
        
        Task {
            self.user.isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
        }
    }
}
