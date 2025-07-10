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


// MARK: Notes
// we use throws outside the function and throw inside the functions.
// we use throw for error and use return for returing the required data.
// If we use async/awiat in function,  we have to use async/await everyWhere in to that functions

// UIViewRepresentable is a protocol that allows to integrate UIKit into swiftUI interface, It acts as bridge to enable to access UIKit components like MKMapView( MK - MapKit), WebView and custom View subclasses with swiftUI.

// Image is used to display assest images and system Image, but asyncImage is used for download and display the Image from Internet.
