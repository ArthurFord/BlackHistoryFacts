//
//  FactService.swift
//  BlackHistoryFacts
//
//  Created by Arthur Ford on 11/14/21.
//

import Foundation


private actor FactServiceStore {
    private var loadedResult = Result(totalResults: 0, results: [Fact(source: "", text: "")])
    private var url: URL {
        urlComponents.url!
    }
    
    private var apiKey: String {
        get {
                // find file
            guard let filePath = Bundle.main.path(forResource: "BHF-PList", ofType: "plist") else {
                fatalError("Couldn't find file 'BHF-PList.plist'.")
            }
                // find key
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'BHF-PList.plist'.")
            }
            return value
        }
    }
    
    
    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rest.blackhistoryapi.io"
        components.path = "/fact/random"
        return components
    }
    
    func load() async throws -> Result {
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        let (data, response) = try await URLSession.shared.data(for: request)
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200
                
        else {
            throw DownloadError.statusNotOk
        }
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(Result.self, from: data)
            return decodedResponse
        } catch {
            print(error.localizedDescription)
        }
        
        return Result(totalResults: 0, results: [Fact(source: "", text: ""  )])
    }
}

enum DownloadError: Error {
    case statusNotOk
    case decoderError
}


class FactService: ObservableObject {
    
    @Published private(set) var factText = "Fact appears here"
    @Published private(set) var source = "source URL"
    @Published private(set) var isFetching = false
    private let store = FactServiceStore()
    
    public init() { }
}

extension FactService {
    @MainActor
    func fetchFact() async throws {
        isFetching = true
        defer { isFetching = false }
        
        let loadedResult = try await store.load()
        factText = loadedResult.results?.first?.text ?? "No Fact Loaded"
        source = loadedResult.results?.first?.source ?? "No Source"
    }
}
