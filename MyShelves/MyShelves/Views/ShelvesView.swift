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
                ForEach(db.collection("users").document(user!.uid).collection("shelves")) { book in
                    NavigationLink {
                        ExploreBookDetail(book: book)
                    } label: {
                        Text(book.title)
                    }
                }
                
                
            }
            .navigationTitle("NYT Best Sellers")
        }
    }
}


#Preview {
    ShelvesView()
}
