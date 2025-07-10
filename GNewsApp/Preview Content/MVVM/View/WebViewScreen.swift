//
//  WebViewScreen.swift
//  GNewsApp
//
//  Created by Suresby on 09/07/25.
//

import SwiftUI

struct WebViewScreen: View {
    
    var urlStr: String?
    
    var body: some View {
        if let urlstr = urlStr, let url = URL(string: urlstr) {
            WebView(url: url)
                .navigationTitle("Web View")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
