//
//  AuthViewModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

@MainActor
class AuthViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var shelves = [LibraryBook]()
    let db = Firestore.firestore()
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
            
        } catch {
            print("Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, username: username, email: email)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            await fetchUser()
        } catch {
            print("Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        print("delete")
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await db.collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
    
    func fetchShelves() async {
        self.shelves.removeAll()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        db.collection("users/\(uid)/shelves").getDocuments() { (querySnapshot, err) in
          if let err = err {
            print("Error getting documents: \(err)")
          } else {
            for document in querySnapshot!.documents {
                do {
                    self.shelves.append(try document.data(as: LibraryBook.self))
                    print("\(document.documentID) => \(document.data())")
                } catch {
                    print("Error adding documents: \(error)")
                }
            }
          }
        }

        
//        do {
//            let querySnapshot = try await db.collection("users").document(uid).collection("shelves").getDocuments()
//            for document in querySnapshot.documents {
////                if let book = try? document.data(as: LibraryBook.self) {
////                    self.shelves.append(book)
////                    print(book.title)
////                }
//            }
//        } catch {
//            print("Error: \(error.localizedDescription)")
//        }
    }
}
