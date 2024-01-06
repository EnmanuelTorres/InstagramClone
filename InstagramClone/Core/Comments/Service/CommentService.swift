//
//  CommentService.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import FirebaseStorage
import Firebase

struct CommentService {
    static func uploadComment(_ comment: Comment, postId: String) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await Firestore
            .firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }
}
