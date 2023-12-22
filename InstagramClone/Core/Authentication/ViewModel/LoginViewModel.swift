//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 22/12/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func SignIn() async throws {
      try await AuthService.shared.login(withEmail: email, password: password)
    }
}
