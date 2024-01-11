//
//  LoadingView.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 11/01/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
                .opacity(0.8)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
