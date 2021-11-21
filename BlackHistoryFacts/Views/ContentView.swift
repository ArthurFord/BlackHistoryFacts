    //
    //  ContentView.swift
    //  BlackHistoryFacts
    //
    //  Created by Arthur Ford on 11/14/21.
    //

import SwiftUI

struct ContentView: View {
    var body: some View {
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
                    .padding(.top, 30)
                Spacer()
                
                    Link(destination: URL(string: "https://blackhistoryapi.com/register")!) {
                        Text("Sign up to contribute")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                        
                
                Spacer()
                Banner()
            }
           
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
