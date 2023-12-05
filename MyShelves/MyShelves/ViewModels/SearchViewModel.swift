//
//  SearchViewModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import Foundation
import UIKit
import FirebaseFirestore
import SwiftUI

class SearchViewModel : ObservableObject {
    @Published private(set) var resultList : BookListModel = BookListModel(totalItems: -1, items: [BookModel]())
    
    @Published var hasError = false
    @Published var imgError = false
    @Published var error : SearchModelError?
    
    private let url = "https://www.googleapis.com/books/v1/volumes?q="
    private let apiKey = "&key=AIzaSyAIjX6s674HiQCW_dZ2m1qSQ5XH3c8bpTw"
    
    @MainActor
    func fetchResults(query: String) async {
        if resultList.items != nil {
            resultList.items!.removeAll()
        }
        let fullQuery = url + query + apiKey
        
        if let url = URL(string: fullQuery) {
            print(fullQuery)
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(BookListModel?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = SearchModelError.decodeError
                    return
                }
                self.resultList = results
            } catch {
                print(error)
                self.hasError.toggle()
                self.error = SearchModelError.customError(error: error)
            }
        }
    }
    
    
    func fetchISBN(book: VolumeModel ) -> String {
        var isbn : String
        let isbnList = book.industryIdentifiers
        if isbnList[0].identifier != nil {
            isbn = (isbnList[0].identifier!)
        } else if isbnList[1].identifier != nil {
            isbn = (isbnList[1].identifier!)
        } else {
            isbn = ""
        }
        return isbn
    }
    
    func fetchListItems() -> [BookModel] {
        let emptyList = [BookModel]()
        guard let listItems = self.resultList.items else { return emptyList }
        return listItems
    }
    

    func hideCoverView(isbn: String) -> Bool{
        var hideCover : Bool = true
        let url = URL(string: "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg")
        url?.isReachable { success in
            if success {
                hideCover = false
            } else {
                hideCover = true
            }
        }
        return hideCover
    }
    
    

}

extension SearchViewModel {
    enum SearchModelError : LocalizedError {
        case decodeError
        case customError(error: Error)

        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
               print(error)
                return error.localizedDescription
            }
        }

    }

}



extension URL {
    func isReachable(completion: @escaping (Bool) -> ()) {
        var request = URLRequest(url: self)
        request.httpMethod = "HEAD"
        URLSession.shared.dataTask(with: request) { _, response, _ in
            completion((response as? HTTPURLResponse)?.statusCode == 200)
        }.resume()
    }
}
