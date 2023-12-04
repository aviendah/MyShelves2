//
//  BookDetail.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import SwiftUI

struct BookDetail: View {
    
    var book : VolumeModel
    @ObservedObject var search = SearchViewModel()
    @ObservedObject var addVM = AddBookViewModel()
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            Text(book.title)
                .font(.system(size: 30))
                .padding(.horizontal)
            HStack {
                CoverView(isbn: search.fetchISBN(book: book))
                Button {
                    Task {
                       await addVM.addBookFromSearch(book: book)
                    }
                     
                } label: {
                    Text("Add to your Shelves")
                }
            }
            CoverView(isbn: search.fetchISBN(book: book))
            ScrollView(.vertical) {
                Text(book.description)
                    .font(.system(size: 18))
                    .padding(.horizontal)
            }
        }
        
    }
}

//#Preview {
//    BookDetail()
//}
