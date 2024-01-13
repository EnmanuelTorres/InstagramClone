//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification: Notification
    var body: some View {
        HStack {
         
            CircularProfileImageView(user: notification.user, size: .xSmall)
            
            //notification message
            HStack{
                Text(notification.user?.username ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold) +
                
                Text(" \(notification.type.notificationMessage)")
                    .font(.footnote) +
                
                Text("\(notification.timestamp.timestampString())")
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
            
            Spacer()
            
            if notification.type != .follow {
                KFImage(URL(string: notification.post?.imageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
                    .padding(.leading, 2)
            }else {
                Button {
                    print("DEBUG: Handle follow here..")
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 88, height: 32)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }

            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell(notification: DeveloperPreview.shared.notifications[0])
}
