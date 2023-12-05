//
//  SearchView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var search = SearchViewModel()
    let searchController = UISearchController.self
    @State var query : String = ""
    @State var searchResults = [BookModel]()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter a keyword", text: $query)
                Button(action: {
                    Task {
                        await search.fetchResults(query: query)
                    }
                }, label: {
                    Text("Search")
                })
                List {
                    if let searchResults = search.resultList.items {
                        ForEach(searchResults) { book in
                            NavigationLink {
                                if let bookItem = book.volumeInfo {
                                    BookDetail(book: bookItem)
                                }
                            } label: {
                                if let title = book.volumeInfo?.title {
                                    Text(title)
                                } else {
                                    Text("")
                            }
                        }
                    }
                    } else {
                        Text("No results available. Please try again.")
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
