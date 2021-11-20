    //
    //  WebViewModel.swift
    //  BlackHistoryFacts
    //
    //  Created by Arthur Ford on 11/20/21.
    //

import Foundation
import WebKit

class WebViewModel: ObservableObject {
    let webView: WKWebView
    let url: URL
    
    init() {
        webView = WKWebView(frame: .zero)
        url = URL(string: "https://blackhistoryapi.com/register")!
        
        loadUrl()
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}
