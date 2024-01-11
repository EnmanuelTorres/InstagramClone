//
//  UserListView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 8/01/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var searchText = ""
    
    private let config: UserListConfig
    
    init(config: UserListConfig){
        self.config = config
    }
    
    var body: some View {
       ScrollView {
           
           LazyVStack(spacing: 12) {
               ForEach(viewModel.users){ user in
                   NavigationLink(value: user) {
                       HStack {
                           CircularProfileImageView(user: user, size: .xSmall)
                           
                           VStack(alignment: .leading) {
                               Text(user.username)
                               
                               if let fullName = user.fullname {
                                   Text(fullName)
                               }
                               
                           }
                           .font(.footnote)
                           
                           Spacer()
                       }
                       .foregroundStyle(.black)
                       .padding(.horizontal)
                   }
               }
           }
           .navigationDestination(for: User.self, destination: { user in
               ProfileView(user: user)
           })
           .padding(.top, 8)
           .searchable(text: $searchText, prompt: "Search...")
      }
       .task{
           await viewModel.fetchUsers(forConfig: config)
       }
    }
}

#Preview {
    UserListView(config: .explore)
}
