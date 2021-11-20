//
//  ContributorView.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/20/21.
//

import SwiftUI
import WebKit

struct ContributorView: View {
    
    @StateObject var webViewModel = WebViewModel()
    
    var body: some View {
        WebView(webView: webViewModel.webView)
            .padding()
    }
}

struct Contributor_Previews: PreviewProvider {
    static var previews: some View {
        ContributorView()
    }
}
