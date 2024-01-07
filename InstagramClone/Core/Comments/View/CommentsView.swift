//
//  CommentsView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var commentText = ""
    @StateObject var viewModel : CommentsViewModel
    
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    init(post: Post){
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    var body: some View {
        VStack {
            Text("Comments")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 24){
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            .padding(.top)
            
            Divider()
            
            HStack(spacing: 12) {
                CircularProfileImageView(user: currentUser, size: .xSmall)
                
                ZStack(alignment: .trailing){
                    TextField("Add a comment...", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5),lineWidth: 1)
                        }
                    
                    Button{
                        Task { 
                            try await viewModel.uploadComment(commentText: commentText)
                            commentText = ""
                        }
                    } label: {
                        Text("Post")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                }
            }
            .padding(12)
        }
    }
}

#Preview {
    CommentsView(post: Post.MOCK_POSTS[2])
}
