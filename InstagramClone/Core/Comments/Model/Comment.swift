//
//  Comment.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    let postOwnerUid: String
    let commentText: String
    let postId: String
    let timeStamp: Timestamp
    let commentOwnerUid: String
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
   
}
