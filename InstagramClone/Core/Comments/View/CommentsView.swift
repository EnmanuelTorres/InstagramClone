//
//  CommentsView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 6/01/24.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var commentText = ""
    var body: some View {
        VStack {
            Text("Comments")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 24){
                    ForEach(0 ... 15, id: \.self) { comment in
                        CommentCell()
                    }
                }
            }
            .padding(.top)
            
            Divider()
            
            HStack(spacing: 12) {
                CircularProfileImageView(user: User.MOCK_USERS[0], size: .xSmall)
                
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
    CommentsView()
}
