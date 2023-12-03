//
//  SearchViewModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published private(set) var resultList : BookListModel = BookListModel(totalItems: -1, items: [BookModel(id: "", volumeInfo: [VolumeModel(title: "", authors: [String](), imageLinks: [ImageLinkModel(smallThumbnail: "", thumbnail: "")])])])
    
    @Published var hasError = false
    @Published var error : SearchModelError?
    
    private let url = "https://www.googleapis.com/books/v1/volumes?q="
    private let apiKey = "&key=AIzaSyAIjX6s674HiQCW_dZ2m1qSQ5XH3c8bpTw"
    
    func fetchResults(query: String) async {
        
        let fullQuery = url + query + apiKey
        
        if let url = URL(string: fullQuery) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(BookListModel?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = SearchModelError.decodeError
                    return
                }
                self.resultList = results
            } catch {
                self.hasError.toggle()
                self.error = SearchModelError.customError(error: error)
            }
        }
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
