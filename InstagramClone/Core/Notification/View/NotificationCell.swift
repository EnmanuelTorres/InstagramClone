//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView(user: nil, size: .xSmall)
            
            //notification message
            HStack{
                Text("yuki")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text(" likes one of your posts.")
                    .font(.footnote) +
                
                Text(" 3w")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
            
            Spacer()
            
            Image("luisSilva")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .padding(.leading, 2)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
