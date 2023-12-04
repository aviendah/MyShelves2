//
//  BookCoverViewModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import Foundation
import SwiftUI

class BookCoverViewModel : ObservableObject {
    
}
    
//    let search = SearchViewModel()
//    
//    func displayCover(isbn: String) {
//        
//        let imgURL = "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg"
//        let url = URL(string: imgURL)
//        let repURL = "https://i.imgur.com/J5LVHEL.jpg"
//        let repUrl = URL(string: imgURL)
//        
//        let replaceCover = AsyncImage(url: repUrl) { image in
//            image.resizable()
//                .scaledToFit()
//                .cornerRadius(10)
//                .frame(width: 150, height: 300)
//        } placeholder: {
//            ProgressView()
//        }
//        
//        
//        let bookCover = AsyncImage(url: url) { image in
//            image.resizable()
//                .scaledToFit()
//                .cornerRadius(10)
//                .frame(width: 150, height: 300)
//        } placeholder: {
//            ProgressView()
//        }
//        
//        
//        VStack{
//            HStack{
//                bookCover
//                replaceCover.hidden()
//            }
//            Button(action: {
//                bookCover.hidden()
//                replaceCover.opacity(1.0)
//            }, label: {
//                Text("Click Here if there is No Image")
//            })
//        }
//        
//        
//        
//    }
//    
//}
//
//    func fetchCoverURL(isbn: String) -> String {
//        let urlStr = "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg"
//        return urlStr
//        
//    }
//    
//    func fetchCoverImage(isbn: String) {
//        let urlStr = "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg"
//        var didItLoad = Text("Oops! Cover Unavailable")
//        var phaseError : Error
//        
//        let bookCover = AsyncImage(url: URL(string: urlStr)) { phase in
//            if let image = phase.image {
//                image.resizable()
//                    .scaledToFit()
//                    .cornerRadius(5)
//                    .frame(width: 150, height: 200)
//            } else if (phase.error != nil) {
//                didItLoad
//            } else {
//            placeholder: do {
//                ProgressView()
//            }
//            }
//        }
//        
//        if (bookCover.confirmationDialog(bookCover, isPresented: <#T##Binding<Bool>#>, actions: <#T##() -> View#>)
//        
//        
//
//    }
//    
//}
//
//
