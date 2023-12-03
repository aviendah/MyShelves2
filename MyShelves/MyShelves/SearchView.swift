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
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter a keyword", text: $query)
                Section {
                    Button(action: {
                        Task {
                            await search.fetchResults(query: query)
                        }
                    }, label: {
                        Text("Search")
                    })
                }
            }
            List {
                ForEach(search.resultList.items) { book in
                    NavigationLink {
                        //Book Detail
                    } label: {
                        Text(book.volumeInfo.title)

                    }

                }
                
            }
        }
    }
}

#Preview {
    SearchView()
}
