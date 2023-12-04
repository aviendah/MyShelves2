//
//  LibraryBook.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/3/23.
//

import Foundation

struct LibraryBook : Codable, Identifiable {
    let id: String
    let title: String
    let author: String
    let description: String
    let review: String
    let isbn: String
    
}
