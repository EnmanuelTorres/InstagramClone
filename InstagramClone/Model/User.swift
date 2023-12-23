//
//  User.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 18/12/23.
//

import Foundation
import Firebase


struct User: Identifiable, Codable, Hashable {
    var id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentuser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "rey.Armas", profileImageUrl: "reynaldoArmas", fullname: "Reyanldo Armas", bio: "Singer", email: "rey@gmail.com"),
        
            .init(id: NSUUID().uuidString, username: "Arnulfo.Briseno", profileImageUrl: "arnulfoBriceno", fullname: "Arnulfo Briceno", bio: "Lawyer", email: "arnulfo@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "silva_Luis", profileImageUrl: "luisSilva", fullname: "Luis Silva", bio: "butcher", email: "luis@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "vitico.Castillo", profileImageUrl: "viticoCastillo", fullname: "Vitico Castillo", bio: "Singer", email: "vitico@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "Armando.Martinez", profileImageUrl: "armandoMartinez", fullname: "Armando Martinez", bio: "Firefighter", email: "armando@gmail.com"),
    ]
}
