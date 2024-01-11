//
//  NotificationView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach( 0 ..< 20) { notification in
                        NotificationCell()
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotificationView()
}
