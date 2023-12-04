//
//  HomeView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                
                NavigationLink {
                  ShelvesView()
                } label: {
                    Text("Your Shelves")
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
    HomeView()
}
