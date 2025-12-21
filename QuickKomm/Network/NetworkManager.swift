//
//  Network.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//

import Foundation
import Combine


public final class NetworkManager {
    public static let shared = NetworkManager()
    
    private let service: NetworkService
    
    private let isLoggingEnabled: Bool = true
    
    private init() {
        let config = DefaultNetworkConfiguration(environment: .development, tokenProvider: DefaultAuthTokenProvider(),loggingEnabled: isLoggingEnabled)
        self.service = DefaultNetworkService(config: config,)
    }
    
    public func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        try await service.request(endpoint)
    }
    

}
