//
//  BookListModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import Foundation

struct BookListModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    var totalItems : Int
    var items : [BookModel]
    
}

struct BookModel : Codable, Identifiable {
    var id : String
    var volumeInfo : [VolumeModel]
}

struct VolumeModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    var title : String
    var authors : [String]
    var imageLinks : [ImageLinkModel]
}

struct ImageLinkModel : Codable {
    var smallThumbnail : String
    var thumbnail : String
}
