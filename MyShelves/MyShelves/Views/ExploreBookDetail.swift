//
//  ExploreBookDetail.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI

struct ExploreBookDetail: View {
    
    var book : bsBookModel
    @ObservedObject var explore = ExploreViewModel()
    @ObservedObject var search = SearchViewModel()
    @ObservedObject var addVM = AddBookViewModel()
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            Section {
                Text(book.title)
                    .font(.system(size: 35))
                    .padding(.horizontal)
                    .padding(.top)
                
                HStack {
                    ExploreCoverView(book_image: book.book_image)
                    Button {
                        Task {
                           await addVM.addBookFromExplore(book: book)
                        }
                         
                    } label: {
                        Text("Add to your Shelves")
                    }
                }
                
            }
            Section {
                ScrollView(.vertical) {
                    Text(book.description)
                        .font(.system(size: 22))
                        .padding(.horizontal)
                }
            }
        }
        
    }
}


#Preview {
    ExploreBookDetail(book: bsBookModel(title: "Iron Flame", author: "Rebecca Yarros", rank: 1, weeks_on_list: 3, book_image: "https://storage.googleapis.com/du-prd/books/images/9781649374172.jpg", description: "The second book in the Empyrean series. Violet Sorrengail’s next round of training might require her to betray the man she loves."))
}
