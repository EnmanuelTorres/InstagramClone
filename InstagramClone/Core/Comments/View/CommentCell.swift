//
//  CommentCell.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//


import SwiftUI

struct CommentCell: View {
    
    let comment: Comment
    
    private var user: User? {
        return comment.user
    }
    
    
    var body: some View {
        HStack {
            
            CircularProfileImageView(user: user, size: .xSmall)
            
            VStack(alignment: .leading, spacing: 4){
                HStack(spacing: 2){
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    
                    Text("6d")
                        .foregroundStyle(.gray)
                    
                }
                
                Text(comment.commentText)
               
            }
            .font(.caption)
            Spacer()
        }
        .padding(.horizontal)
    }
}


#Preview {
    CommentCell(comment: DeveloperPreview.shared.comment)
}
