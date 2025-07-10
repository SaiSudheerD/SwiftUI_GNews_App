//
//  Untitled.swift
//  GNewsApp
//
//  Created by Suresby on 08/07/25.
//
import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var newsModelData : ArticleResponse?
    @Published var isLoading: Bool?
    @Published var errorMessage: String?
    
    
    func fetchNewsData() async {
        guard let url = URL(string: Secrets.api_key) else { return }
        isLoading = true
        errorMessage = nil
        do {
            let response = try await APICallManager.shared.fetchNews(url: url)
            newsModelData = response
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
        
    }
    
}
