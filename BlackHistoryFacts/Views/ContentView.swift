    //
    //  ContentView.swift
    //  BlackHistoryFacts
    //
    //  Created by Arthur Ford on 11/14/21.
    //

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .topTrailing) {
                    ZStack {
                        Header()
                            .fill(Color.yellow)
                            .ignoresSafeArea(edges: .top)
                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            .frame(height: 200)
                        
                        VStack {
                            Text("✊🏿")
                                .font(.system(size: 80))
                                .fontWeight(.black)
                            
                            Text("Black History Facts")
                                .font(.largeTitle)
                                .fontWeight(.black)
                        }
                    }
                }
                FactCard()
                    .padding()
                NavigationLink(destination: ContributorView()) {
                    Text("Contribute")
                        .font(.title3)
                        .padding()
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
