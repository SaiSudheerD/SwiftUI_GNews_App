//
//  HomeScreen.swift
//  GNewsApp
//
//  Created by Suresby on 08/07/25.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading ?? false {
                    VStack {
                        Spacer()
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                        Spacer()
                    }
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)").foregroundColor(.red)
                }else {
                    List {
                        if let articlesList = viewModel.newsModelData?.articles {
                            ForEach(articlesList, id: \.id) { article in
                                NavigationLink(destination: ArticleDetailView(articleObj: article)) {
                                    ArticleView(
                                        title: article.title,
                                        descritpion: article.description,
                                        imageUrl: article.image,
                                        date: article.publishedAt
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        } else {
                            Text("No articles found.")
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("G News")
            .onAppear {
                Task {
                    await viewModel.fetchNewsData()
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
