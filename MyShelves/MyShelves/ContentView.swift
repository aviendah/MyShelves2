//
//  ContentView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                
                NavigationLink {
//                    ShelvesView()
                } label: {
                    Text("Your Shelves")
                }
                NavigationLink {
                    //                    WishView()
                } label: {
                    Text("Wish List")
                }
                NavigationLink {
                    ExploreView()
                } label: {
                    Text("Explore")
                }
                NavigationLink {
                    SearchView()
                } label: {
                    Text("Search")
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Home Library")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
