//
//  JSONParser.swift
//  News
//
//  Created by  User on 07.02.2022.
//  Copyright © 2022 abr. All rights reserved.
//

import Foundation

class JSONParser {

    func getArticles(completion: @escaping ([Article]?) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd") else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let data = data {
                    let articlesList = try! JSONDecoder().decode(ArticleList.self, from: data)
                    completion(articlesList.articles)
                }
        }.resume()
           
    }
}

struct ArticleList: Decodable {
//    var status: String
//    var total: Int
    var articles: [Article]
}

struct Article: Decodable {
    var source: [String: String?]
    var author: String?
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: String?
    var content: String?
}
