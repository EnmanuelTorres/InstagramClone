//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 29/12/23.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() async throws {
        post.didLike = true
        post.likes += 1
    }
    
    func unlike() async throws {
        post.didLike = false 
        post.likes -= 1
    }
    
    
}
