//
//  NetworkService.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


import Foundation

public protocol NetworkService {
    func request<T: Decodable>(_ endpoint: APIEndPoint) async throws -> T
}


public final class DefaultNetworkService: NetworkService {
    
    private let config: NetworkConfiguration
    
    public init(config: NetworkConfiguration) {
        self.config = config
    }
    
    public func request<T: Decodable>(_ endpoint: APIEndPoint) async throws -> T {

        
        
        let baseURL = URL(string: config.baseURL)!
        
        guard var components = URLComponents(
            url: baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        ) else {
            throw APIError.invalidURL
        }

        components.queryItems = endpoint.queryItems

        guard let url = components.url else {
            throw APIError.invalidURL
        }


        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        config.commonHeaders.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        endpoint.headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        config.loggingEnabled ? logRequest(request) : ()


        if let body = endpoint.body {
            request.httpBody = try JSONEncoder().encode(AnyEncodable(body))
        }

        let (data, response) = try await URLSession.shared.data(for: request)

       
        guard let http = response as? HTTPURLResponse else {
            throw APIError.noData
        }
        
        if config.loggingEnabled {
            logResponse(data: data, response: http)
        }

        guard 200..<300 ~= http.statusCode else {
            throw APIError.serverError(http.statusCode)
        }

        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            config.loggingEnabled ? print(prettyJSON(data)) : ()
            return decoded

        } catch let DecodingError.keyNotFound(key, context) {
            print("""
            ❌ Decoding Error: Key not found
            Key: \(key.stringValue)
            CodingPath: \(context.codingPath.map { $0.stringValue }.joined(separator: " → "))
            Description: \(context.debugDescription)
            """)

            throw APIError.decodingError

        } catch let DecodingError.typeMismatch(type, context) {
            print("""
            ❌ Decoding Error: Type mismatch
            Expected Type: \(type)
            CodingPath: \(context.codingPath.map { $0.stringValue }.joined(separator: " → "))
            Description: \(context.debugDescription)
            """)

            throw APIError.decodingError

        } catch let DecodingError.valueNotFound(type, context) {
            print("""
            ❌ Decoding Error: Value not found
            Expected Type: \(type)
            CodingPath: \(context.codingPath.map { $0.stringValue }.joined(separator: " → "))
            Description: \(context.debugDescription)
            """)

            throw APIError.decodingError

        } catch let DecodingError.dataCorrupted(context) {
            print("""
            ❌ Decoding Error: Data corrupted
            CodingPath: \(context.codingPath.map { $0.stringValue }.joined(separator: " → "))
            Description: \(context.debugDescription)
            """)

            throw APIError.decodingError

        } catch {
            print("❌ Unknown decoding error: \(error)")
            throw APIError.decodingError
        }

        
    }
    
    private func logRequest(_ request: URLRequest) {
        print("""
        ──────── HTTP REQUEST ────────
        URL: \(request.url?.absoluteString ?? "")
        Method: \(request.httpMethod ?? "")
        Headers: \(request.allHTTPHeaderFields ?? [:])
        Body:
        \(request.httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? "nil")
        ──────────────────────────────
        """)
    }
    
    
    private func logResponse(data: Data, response: HTTPURLResponse) {
        print("""
        ──────── HTTP RESPONSE ────────
        Status Code: \(response.statusCode)
        Headers: \(response.allHeaderFields)
        Body:
        \(String(data: data, encoding: .utf8) ?? "Unreadable")
        ───────────────────────────────
        """)
    }
    
    private func prettyJSON(_ data: Data) -> String {
        guard
            let json = try? JSONSerialization.jsonObject(with: data),
            let prettyData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        else {
            return String(data: data, encoding: .utf8) ?? "Invalid JSON"
        }

        return String(data: prettyData, encoding: .utf8) ?? ""
    }


}
