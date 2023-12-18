//
//  User.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 18/12/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "rey_Armas", profileImageUrl: "reynaldoArmas", fullname: "Reyanldo Armas", bio: "Singer", email: "rey@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "arnulfo_Briceno", profileImageUrl: "arnulfoBriceno", fullname: "Arnulfo Briceno", bio: "Lawyer", email: "arnulfo@gmail.com"),
        .init(id: NSUUID().uuidString, username: "silva_Luis", profileImageUrl: "luisSilva", fullname: "Luis Silva", bio: "butcher", email: "luis@gmail.com"),
        .init(id: NSUUID().uuidString, username: "castillo_vitico", profileImageUrl: "viticoCastillo", fullname: "Vitico Castillo", bio: "Singer", email: "vitico@gmail.com"),
        .init(id: NSUUID().uuidString, username: "martinez_Armando", profileImageUrl: "armandoMartinez", fullname: "Armando Martinez", bio: "Firefighter", email: "armando@gmail.com"),
    ]
}
