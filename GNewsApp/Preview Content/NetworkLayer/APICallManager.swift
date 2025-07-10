//
//  APICallManager.swift
//  GNewsApp
//
//  Created by Suresby on 08/07/25.
//

import Foundation
import SwiftUICore

class APICallManager {
    
    static let shared = APICallManager()
    
    func fetchNews(url: URL) async throws -> ArticleResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknow(URLError(.badServerResponse))
        }

        guard httpResponse.statusCode == 200 else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
        
        do {
            let decode = try JSONDecoder().decode(ArticleResponse.self, from: data)
            return decode
        } catch {
            throw NetworkError.decodingError
        }
    }
}
