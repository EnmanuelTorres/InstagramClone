//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 28/12/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap{ try $0.data(as: Post.self) }
        
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let owernUid = post.ownerUID
            let postUser = try await UserService.fetchUser(withUid: owernUid)
            self.posts[i].user = postUser
        }
        
    }
}
