//
//  ShelvesView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ShelvesView: View {
    
    @EnvironmentObject var authVM : AuthViewModel
    
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    
    var body: some View {
        NavigationStack {
            List {

                ForEach(authVM.shelves) { book in
                    NavigationLink {
                        LibraryBookDetail(book: book)
                    } label: {
                        Text(book.title)
                    }
                }
                
            }
            .navigationTitle("My Shelves")
        }
        .task(id: 1, priority: .high, {
            await authVM.fetchUser()
            await authVM.fetchShelves()
        })
    }
}


#Preview {
    ShelvesView()
}
