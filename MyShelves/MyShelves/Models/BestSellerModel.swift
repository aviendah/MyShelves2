//
//  BestSellerModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/1/23.
//

import Foundation

// use "let", never use "var" when working with APIs

struct bsListModel : Codable {
    let num_results : Int?
    let results : bsResultModel // in your API, this is an object, not an array
}

struct bsResultModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let list_name : String
    let books : [bsBookModel]
}

struct bsBookModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let title : String
    let author : String
    let rank : Int
    let weeks_on_list : Int
    let book_image : String
    let description : String

}
