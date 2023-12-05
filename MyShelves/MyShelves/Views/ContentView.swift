//
//  ContentView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        Group {
            if authVM.userSession != nil {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
