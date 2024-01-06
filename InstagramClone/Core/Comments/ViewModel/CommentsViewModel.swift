//
//  CommentsViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import Firebase


class CommentsViewModel: ObservableObject {
    @Published var comments = [Comment]()
    
    private let post: Post
    
    init(post: Post){
        self.post = post
    }
    
    func uploadComment(commentText: String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(
                              postOwnerUid: post.ownerUID,
                              commentText: commentText,
                              postId: post.id,
                              timeStamp: Timestamp(),
                              commentOwnerUid: uid
                              )
        
        try await CommentService.uploadComment(comment, postId: post.id)
    }
}
