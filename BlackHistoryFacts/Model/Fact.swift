//
//  Fact.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/14/21.
//

import Foundation

    // MARK: - Result
struct Result: Codable {
    let totalResults: Int?
    let results: [Fact]?
    
    enum CodingKeys: String, CodingKey {
        case totalResults = "TotalResults"
        case results = "Results"
    }
}

    // MARK: - Fact
struct Fact: Codable {
    let source: String?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case text
    }
}

    // MARK: - CreatedDate
struct CreatedDate: Codable {
    let seconds: Int?
    let nanoseconds: Int?
    
    enum CodingKeys: String, CodingKey {
        case seconds
        case nanoseconds
    }
}
