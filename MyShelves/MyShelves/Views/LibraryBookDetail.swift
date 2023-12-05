//
//  LibraryBookDetail.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/4/23.
//

import SwiftUI

struct LibraryBookDetail: View {
    var book : LibraryBook
    @ObservedObject var search = SearchViewModel()
    @ObservedObject var addVM = AddBookViewModel()
    
    var body: some View {
        
        var hideCoverView = search.hideCoverView(isbn: book.isbn)
        
        VStack(alignment: .center, spacing: 20) {
            Text(book.title)
                .font(.system(size: 30))
                .padding(.horizontal)
            
            if !hideCoverView {
                CoverView(isbn: book.isbn)
            }

            Text(book.author)
            
            ScrollView(.vertical) {
                Text(book.description)
                
            }
        }
        
    }
}

//#Preview {
//    LibraryBookDetail()
//}
