//
//  SearchView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 16/12/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USERS){ user in
                        HStack {
                            Image(user.profileImageUrl ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(user.username)
                                
                                if let fullName = user.fullname {
                                    Text(fullName)
                                }
                                
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
