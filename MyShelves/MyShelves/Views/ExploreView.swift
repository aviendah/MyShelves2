//
//  ExploreView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/1/23.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var explore = ExploreViewModel()
    @ObservedObject var search = SearchViewModel()
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(explore.listResults.results.books) { book in
                    NavigationLink {
                        ExploreBookDetail(book: book)
                    } label: {
                        Text(book.title)
                    }
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("NYT Best Sellers")
                        .font(.largeTitle)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
        
        
        .task(id: 1, priority: .high, {
            await explore.fetchList()
        })
        
        .listStyle(.grouped)
        
        .alert(isPresented: $explore.hasError, error: explore.error) {
            Text("")
        }
    }
    
}
        

#Preview {
    ExploreView()
}

    
