//
//  NetworkService.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


import Foundation

public protocol NetworkService {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}


public final class DefaultNetworkService: NetworkService {
    
    private let config: NetworkConfiguration
    
    public init(config: NetworkConfiguration) {
        self.config = config
    }
    
    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        
        guard var components = URLComponents(string: config.baseURL + endpoint.path) else {
            throw APIError.invalidURL
        }
        
        print("api componany \( components)")
        
        components.queryItems = endpoint.queryItems
        
        
        print("end point, \(endpoint.body)")
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        // Common headers + endpoint headers
        config.commonHeaders.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        endpoint.headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        if let body = endpoint.body {
            print("body \(body)")
            request.httpBody = try JSONEncoder().encode(AnyEncodable(body))
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw APIError.noData
        }
        
        guard 200..<300 ~= http.statusCode else {
            throw APIError.serverError(http.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError
        }
        
    }
}
