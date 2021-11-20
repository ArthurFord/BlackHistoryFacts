//
//  Header.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/18/21.
//

import SwiftUI

struct Header: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + 100))
        path.closeSubpath()
        
        return path
        
    }
    
    
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
            .frame(height: 200)
    }
}
