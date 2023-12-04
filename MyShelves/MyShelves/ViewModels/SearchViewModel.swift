//
//  SearchViewModel.swift
//  MyShelves
//
//  Created by Tatum Manning on 12/2/23.
//

import Foundation
import UIKit
import FirebaseFirestore

class SearchViewModel : ObservableObject {
    @Published private(set) var resultList : BookListModel = BookListModel(totalItems: -1, items: [BookModel]())
    
    @Published var hasError = false
    @Published var imgError = false
    @Published var error : SearchModelError?
    
    private let url = "https://www.googleapis.com/books/v1/volumes?q="
    private let apiKey = "&key=AIzaSyAIjX6s674HiQCW_dZ2m1qSQ5XH3c8bpTw"
    
    @MainActor
    func fetchResults(query: String) async {
        resultList.items.removeAll()
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
    
    func fetchCoverURL(isbn: String) -> String {
        let urlStr = "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg"
        return urlStr
        
    }
    
    func downloadImage(_ urlString: String, completion: ((_ _image: UIImage?, _ urlString: String?) -> ())?) {
           guard let url = URL(string: urlString) else {
              completion?(nil, urlString)
              return
          }
          URLSession.shared.dataTask(with: url) { (data, response,error) in
             if let error = error {
                print("error in downloading image: \(error)")
                completion?(nil, urlString)
                return
             }
             guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                completion?(nil, urlString)
                return
             }
             if let data = data, let image = UIImage(data: data) {
                completion?(image, urlString)
                return
             }
             completion?(nil, urlString)
          }.resume()
       }
    
    
//    func createUser(withEmail email: String, password: String, username: String) async throws {
    //        do {
    //            let result = try await Auth.auth().createUser(withEmail: email, password: password)
    //            self.userSession = result.user
    //            let user = User(id: result.user.uid, username: username, email: email)
    //            let encodeUser = try Firestore.Encoder().encode(user)
    //            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    //            await fetchUser()
    //        } catch {
    //            print("Failed to create user with error \(error.localizedDescription)")
    //        }
    //    }
    
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

//let url = URL(String: urlStr)
//let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//    if let error = error {
//        // handle error
//        self.imgError.toggle()
//        self.error = SearchModelError.customError(error: error)
//        return
//       }
//       guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//          // handle error
//           self.imgError.toggle()
//           self.error = SearchModelError.customError(error: error?.localizedDescription)
//          return
//       }
//       if let data = data {
//          // process data
//           
//       }
//    }
//    task.resume()
