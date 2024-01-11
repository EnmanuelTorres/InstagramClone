//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 18/12/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { 
            Task {
                await loadImage(fromItem: selectedImage)
                 }
        }
    }
    
    @Published var postImage: Image?
    @Published var uiImage: UIImage?
    
    @Published var isLoading = false
    
    func loadImage(fromItem item:  PhotosPickerItem?) async {
        guard let item = item else {
            return
        }
        
        guard let data = try? await item.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) else {
            return
        }
        
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        isLoading = true
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let uiImage = uiImage else { return }
        
        let postRef = FirebaseConstants.PostsCollection.document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID,
                        ownerUID: uid,
                        caption: caption,
                        likes: 0,
                        imageUrl: imageUrl,
                        timestamp: Timestamp())
        
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
        isLoading = false
    }
}
