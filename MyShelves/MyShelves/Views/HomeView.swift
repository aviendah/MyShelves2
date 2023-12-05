//
//  HomeView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var authVM : AuthViewModel
    
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
                NavigationLink {
                    ProfileView()
                } label: {
                    Text("My Profile")
                }
                
            }
//            .listStyle(.grouped)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("The Library")
                        .font(.largeTitle)
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
