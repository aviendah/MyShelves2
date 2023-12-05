//
//  CoverView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import SwiftUI

struct CoverView: View {
    
    @ObservedObject var search = SearchViewModel()
    @ObservedObject var explore = ExploreViewModel()
    let isbn : String
    
    var body: some View {
       
        let imgURL = "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg"
        let url = URL(string: imgURL)
        

        
        VStack{
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 150, height: 300)
                    } else if phase.error != nil {
                        Image("UnavailableCover")
                    } else {
                        ProgressView()
                    }
                }
        }
        
    }
}

#Preview {
    CoverView(isbn: "9781635574050")
}



//9781619634459
