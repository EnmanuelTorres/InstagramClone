//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 22/12/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    
    init(){
        Task {
           try await fetchAllUsers()
        }
    }
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService.fetchAllUser()
    }
}
