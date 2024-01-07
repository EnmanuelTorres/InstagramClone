//
//  PostService.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 28/12/23.
//

import Firebase

struct PostService {
    
    private static let postsCollection = FirebaseConstants.PostsCollection
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap{ try $0.data(as: Post.self) }
        
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUID
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        
        let snapshot = try await postsCollection.whereField("ownerUID", isEqualTo: uid).getDocuments()
        
        return try snapshot.documents.compactMap{ try $0.data(as: Post.self) }
    }
}

//MARK: - Likes
extension PostService {
    static func likePost(_ post: Post) async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postsCollection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).setData([:])
    }
    
    static func unlikePost(_ post: Post) async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await postsCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await postsCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).delete()
    }
    
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else {return false }
        
        let snapshot =  try await FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).getDocument()
        return snapshot.exists
    }
}
