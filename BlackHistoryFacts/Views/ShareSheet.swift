//
//  ShareSheet.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/16/21.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    
    var text: String
    var source: String
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityVC = UIActivityViewController(activityItems: [text, source], applicationActivities: nil)
        
        return activityVC
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIActivityViewController
}


struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet(text: "", source: "")
    }
}
