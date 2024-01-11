//
//  FeedView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 16/12/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    private var isLoading: Bool {
        return viewModel.isLoading
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.posts) { post in
                            FeedCell(post: post)
                        }
                    }
                    .padding(.top, 8)
                    
                    if isLoading {
                      LoadingView()
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram_logo_black")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 32)
                }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
