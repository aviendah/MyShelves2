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
        
//        let imageView = UIImageView(image: UIImage(contentsOfFile: "UnavailableCover"))
        
//        let replaceCover = AsyncImage(url: repUrl) { image in
//            image.resizable()
//                .scaledToFit()
//                .cornerRadius(10)
//                .frame(width: 150, height: 300)
//        } placeholder: {
//            ProgressView()
//        }
        
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
    CoverView(isbn: "9781619634459")
}

//        let imageView = UIImageView(image: bookCover)
//
//       var bookCover = AsyncImage(url: URL(string: imgURL)) { image in
//            image.resizable()
//                .scaledToFit()
//                .cornerRadius(5)
//                .frame(width: 150, height: 200)
//
//        } placeholder: {
//            ProgressView()
//        }
        
//        var unavailableBookCover = Image("UnavailableCover")
        
        
//        if bookCover.
//                  let imageView = UIImageView()
        //        var bookCover : UIImage
        ////        = UIImage(imageLiteralResourceName: "UnavailableCover")
        //
        //        if let data = NSData(contentsOf: url) {
        //            bookCover = UIImage(data: data as Data) ??  UIImage(imageLiteralResourceName: "UnavailableCover")
        //        } else {
        //            bookCover = UIImage(imageLiteralResourceName: "UnavailableCover")
        //        }
        //
        ////        imageView.image = bookCover
        //        Image(uiImage: bookCover)
        //    }
        //}
        //

////            HStack{
//                bookCover
//                replaceCover.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
//            }
//            Button(action: {
//                bookCover.disabled(true)
//                replaceCover.disabled(false)
//            }, label: {
//                Text("Click if there is no Image")
//            })

//            image.resizable()
//                .scaledToFit()
//                .cornerRadius(10)
//                .frame(width: 150, height: 300)
//        } placeholder: {
//            ProgressView()
//        }
//
//        if bookCover. {
//
//        }
//
