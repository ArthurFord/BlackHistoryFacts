    //
    //  FactCard.swift
    //  BlackHistoryFacts
    //
    //  Created by Arthur Ford on 11/14/21.
    //

import SwiftUI
import Social

struct FactCard: View {
    
    @StateObject var factService = FactService()
    
    @State var shareSheetIsPresented = false
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .trailing) {
                Text(factService.factText)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .task {
                        do {
                            try? await factService.fetchFact()
                        }
                    }
                    .padding(.vertical)
                Text(factService.source)
                    .font(.caption)
            }
            
            Button("Get new fact") {
                Task {
                    try? await factService.fetchFact()
                }
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
            Image(systemName: "square.and.arrow.up")
                .font(.largeTitle)
                .padding()
                .onTapGesture {
                    shareSheetIsPresented.toggle()
                }
                .sheet(isPresented: $shareSheetIsPresented) {
                    ShareSheet(text: factService.factText, source: factService.source)
                }
            
        }
        .padding()
        
    }
}



struct factCard_Previews: PreviewProvider {
    static var previews: some View {
        FactCard()
    }
}


