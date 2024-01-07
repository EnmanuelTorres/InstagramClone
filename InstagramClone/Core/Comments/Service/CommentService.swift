//
//  CommentService.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import FirebaseStorage
import Firebase

struct CommentService {
    
    let postId: String
    
     func uploadComment(_ comment: Comment) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        
        try await FirebaseConstants
             .PostsCollection
            .document(postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }
    
     func fetchComments()  async throws  -> [Comment]{
        let snapshot = try await FirebaseConstants
             .PostsCollection
            .document(postId)
            .collection("post-comments")
            .order(by: "timeStamp", descending: true)
            .getDocuments()
        
         return snapshot.documents.compactMap{ try? $0.data(as: Comment.self)}
    }
}
