//
//  MainTabView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 15/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Upload")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
