//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 7/01/24.
//

import Foundation

class ProfileViewModel : ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}

// MARK: - Following

extension ProfileViewModel {
    func follow(){
        user.isFollowed = true
    }
    
    func unfollow(){
        user.isFollowed = false
    }
    
    func checkIfUserIsFollowed(){
        
    }
}
