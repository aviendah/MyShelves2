//
//  ProfileView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authVM : AuthViewModel
//    @State private var homePressed : Bool = false
//    @State private var shelvesPressed : Bool = false
    
    var body: some View {
        if let user = authVM.currentUser {
            NavigationStack {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(.circle)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.username)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                                    .accentColor(.gray)
                            }
                        }
                    }
                    
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            
                            Spacer()
                            
                            Text("1.0.0")
                                .font(.subheadline)
                                .accentColor(.gray)
                            
                        }
                    }
                    
                    Section("Pages") {
                        
                        NavigationLink {
                            HomeView()
                        } label: {
                            SettingsRowView(imageName: "house.fill", title: "HomePage", tintColor: Color(.systemBrown))
                        }
                        NavigationLink {
                            ShelvesView()
                        } label: {
                            SettingsRowView(imageName: "books.vertical.fill", title: "Your Shelves", tintColor: Color(.systemBrown))

                        }
                        
//                        Button(action: {
//                            homePressed.toggle()
//                            
//                        }, label: {
//                            SettingsRowView(imageName: "house.fill", title: "HomePage", tintColor: Color(.systemBrown))
//                        })
//                       
//
//                        Button {
//                            NavigationLink {
//                                ShelvesView()
//                            } label: {
//                                Text("")
//                            }
//                        } label: {
//                            SettingsRowView(imageName: "books.vertical.fill", title: "Your Shelves", tintColor: Color(.systemBrown))
//                        }
                        
                        
                    }
                    
                    Section("Account") {
                        
                        
                        Button(action: {
                            authVM.signOut()
                        }, label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                        })
                        Button(action: {
                            print("delete...")
                        }, label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                        })
                    }
                }
            }
        }
        
    }
}

//#Preview {
//    ProfileView()
//}
