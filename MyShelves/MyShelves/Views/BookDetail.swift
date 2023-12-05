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
        
        var hideCoverView = search.hideCoverView(isbn: search.fetchISBN(book: book))
        
        VStack(alignment: .center, spacing: 20) {
            Text(book.title)
                .font(.system(size: 30))
                .padding(.horizontal)
            
            if !hideCoverView {
                CoverView(isbn: search.fetchISBN(book: book))
            }

            Text(book.authors[0])
            Button {
                Task {
                    await addVM.addBookFromSearch(book: book)
                }
                
            } label: {
                Text("Add to your Shelves")
            }
            .buttonStyle(.bordered)
            .tint(Color(.systemBrown))
            
            ScrollView(.vertical) {
                if book.description != nil {
                    Text(book.description!)
                        .font(.system(size: 18))
                        .padding(.horizontal)
                } else {
                    Text("There is no description at this time.")
                        .font(.system(size: 18))
                        .padding(.horizontal)
                }
                
            }
        }
        
    }
}

//#Preview {
//    BookDetail()
//}
