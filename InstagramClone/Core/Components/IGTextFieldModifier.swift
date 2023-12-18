//
//  IGTextFieldModifier.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 18/12/23.
//


import SwiftUI

struct IGTextFieldModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
    
    
}
