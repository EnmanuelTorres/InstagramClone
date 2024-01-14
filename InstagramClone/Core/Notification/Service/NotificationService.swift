//
//  NotificationService.swift
//  InstagramClone
//
//  Created by ENMANUEL TORRES on 12/01/24.
//

import Firebase

class NotificationService {
    
    func fetchNotification() async throws -> [Notification] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        let snapshot = try await FirebaseConstants
            .UserNotificationCollection(uid: currentUid)
            .getDocuments()
        
        return snapshot.documents.compactMap{ try? $0.data(as: Notification.self)}
    }
    
    func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        let ref = FirebaseConstants.UserNotificationCollection(uid: uid).document()
        
        let notification = Notification(id: ref.documentID,
                                        postId: post?.id,
                                        timestamp: Timestamp(),
                                        notificationSenderUid: currentUid,
                                        type: type)
        
        guard let notificationData = try? Firestore.Encoder().encode(notification) else { return }
        
        ref.setData(notificationData)
        
    }
    
    func deleteNotification(toUid uid: String, type: NotificationType, postId: String? = nil) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid, uid != currentUid else { return }
        print("el uid es: \(uid)")
        do {
            let snapshot = try await FirebaseConstants
                .UserNotificationCollection(uid: uid)
                .whereField("notificationSenderUid", isEqualTo: currentUid)
                .getDocuments()
            
            for document in snapshot.documents {
                guard let notification = try? document.data(as: Notification.self) else {
                    continue
                }
                
                if postId != nil {
                    guard postId == notification.postId else {
                        continue }
                    try await document.reference.delete()
                }
               
               try await document.reference.delete()
                
            }
        }catch {
            print(error.localizedDescription)
        }
        
       
        
        
    }
}
