//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 23/12/23.
//

import SwiftUI
import PhotosUI
import Firebase


@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var profileImage: Image?
    
    @Published var fullName = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User){
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        
        guard let item = item else {
            return
        }
            guard let data = try? await item.loadTransferable(type: Data.self) else {
                return
            }
            guard let uiImage = UIImage(data: data) else {
                return
            }
            self.uiImage = uiImage
            self.profileImage = Image(uiImage: uiImage)
        }
    
    
    func updateUserData() async throws{
        // update profile image if changed
        var data = [String: Any]()
        
        if let uiImage = uiImage {
          let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        //update name if changed
        if !fullName.isEmpty && user.fullname != fullName {
            data["fullname"] = fullName
        }
        
        //update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
       
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
