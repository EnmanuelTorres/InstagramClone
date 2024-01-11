//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 22/12/23.
//

import Foundation
@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    func SignIn() async throws {
        isLoading = true
      try await AuthService.shared.login(withEmail: email, password: password)
        isLoading = false
    }
}
