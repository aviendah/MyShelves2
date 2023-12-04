//
//  ExploreCoverView.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import SwiftUI

struct ExploreCoverView: View {
    
    var book_image : String
    
    var body: some View {
        
        let url = URL(string: book_image)
        
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 150, height: 300)
            } else if phase.error != nil {
                ProgressView()
            } else {
                ProgressView()
            }
        }
        
    }
}

#Preview {
    ExploreCoverView(book_image: "https://storage.googleapis.com/du-prd/books/images/9781649374172.jpg")
}
