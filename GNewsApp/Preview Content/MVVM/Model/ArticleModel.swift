//
//  ArticleModel.swift
//  GNewsApp
//
//  Created by Suresby on 08/07/25.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Articles]
}

struct Articles: Identifiable, Decodable {
    var id: String { url }
    var content: String
    var description: String
    var image: String
    var publishedAt: String
    var title: String
    var url: String
}
