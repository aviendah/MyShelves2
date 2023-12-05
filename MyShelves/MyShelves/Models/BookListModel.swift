//
//  BookListModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import Foundation

struct BookListModel : Codable {
    let totalItems : Int
    var items : [BookModel]?
    
}

struct BookModel : Codable, Identifiable {
    let id : String
    let volumeInfo : VolumeModel?
}

struct VolumeModel : Codable, Identifiable {
    var id : UUID {
        UUID()
    }
    let title : String
    let authors : [String]
    let imageLinks : ImageLinkModel
    let description : String?
    let industryIdentifiers : [ISBNModel]
}

struct ImageLinkModel : Codable {
    let smallThumbnail : String
    let thumbnail : String
}

struct ISBNModel : Codable {
    let type : String?
    let identifier : String?
}
