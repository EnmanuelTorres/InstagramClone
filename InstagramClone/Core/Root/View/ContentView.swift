//
//  ContentView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 15/12/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
