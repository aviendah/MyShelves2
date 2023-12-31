//
//  AddBookModelView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class AddBookViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    func addBookFromSearch(book: VolumeModel) async {
        @DocumentID var id: String? = UUID().uuidString
        do {
            var bookDescription = book.description ?? "There is no description at this time."
            
           try await
                db.collection("users").document(user!.uid).collection("shelves").document().setData([
                "id": id as Any,
                "title": book.title,
                "author": book.authors.first!,
                "description": bookDescription,
                "coverURL" : book.imageLinks.thumbnail,
                "isbn": book.industryIdentifiers.first!.identifier!,
                "review": ""
            ])
        } catch {
            print("Could not add book to shelf due to \(error.localizedDescription)")
        }
    }
    
    func addBookFromExplore(book: bsBookModel) async {
        @DocumentID var id: String? = UUID().uuidString
        
        do {
           try await db.collection("users").document(user!.uid).collection("shelves").document().setData([
            "id": id as Any,
                "title": book.title,
                "author": book.author,
                "description": book.description,
                "coverURL" : book.book_image,
                "isbn": "",
                "review": ""
            ])
        } catch {
            print("Could not add book to shelf due to \(error.localizedDescription)")
        }
    }
    
  
}
