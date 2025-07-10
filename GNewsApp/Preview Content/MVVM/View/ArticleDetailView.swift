//
//  ArticleDetailView.swift
//  GNewsApp
//
//  Created by Suresby on 09/07/25.
//

import SwiftUI

struct ArticleDetailView: View {
    var articleObj: Articles?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let imageUrlString = articleObj?.image, let imageUrl = URL(string: imageUrlString) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: UIScreen.main.bounds.width, height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200)
                        case .failure(_):
                            Image("noImage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200)
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image("noImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200)
                }
                
                Text(articleObj?.title ?? "No Title")
                    .font(.headline)
                Text(articleObj?.content ?? "No Content")
                    .font(.body)
                NavigationLink("Click here for more information") {
                    WebViewScreen(urlStr: articleObj?.url)
                }
            }
            .padding()
        }
    }
}
