//
//  APIClient.swift
//  Vocap
//
//  Created by Anthony Tran on 8/6/24.
//

import Foundation

class APIClient {
    struct Configuration {
        let baseURL: URL
        
        init(baseURL: URL) {
            self.baseURL = baseURL
        }
    }
    
    let session: URLSession
    let configuration: Configuration
    
    init(session: URLSession, configuration: Configuration) {
        self.session = session
        self.configuration = configuration
    }
    
    func execute<Request: APIRequest>(_ request: Request)
    async throws -> Request.Response {
        print("-> execute request \(request.path)")
        let (data, _) = try await session.data(for: request.makeURLRequest(configuration: self.configuration))
        let decoded = try request.decode(data: data)
        return decoded
    }
}
