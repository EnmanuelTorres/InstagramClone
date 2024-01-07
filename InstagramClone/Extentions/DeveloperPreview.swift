//
//  DeveloperPreview.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import SwiftUI
import Firebase


struct DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOwnerUid: "123",
                          commentText: "Test comment for now",
                          postId: "34456",
                          timeStamp: Timestamp(),
                          commentOwnerUid: "27337939")
}
