//
//  ArticleView.swift
//  GNewsApp
//
//  Created by Suresby on 09/07/25.
//

import SwiftUI

struct ArticleView: View {
    
    var title:String
    var descritpion: String
    var imageUrl: String
    var date:String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            if let imageUrl = URL(string: imageUrl) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: 100, maxHeight: 100)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 200)
                    case .failure(_):
                        Image("noImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image("noImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .lineLimit(5)
                
                Text(convertUTCtoLocal(utcDateString: date) ?? "Invalid Time")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 4)
        }
        .padding(.all, 0)
        .frame(height: 100)
    }
}
