//
//  DefaultNetworkConfiguration.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//

import Foundation


public final class DefaultNetworkConfiguration: NetworkConfiguration {
    
    public var loggingEnabled: Bool
    public let environment: NetworkEnvironment
    private let tokenProvider: AuthTokenProvider

    public init(
        environment: NetworkEnvironment,
        tokenProvider: AuthTokenProvider,
        loggingEnabled:Bool = false
    ) {
        self.environment = environment
        self.tokenProvider = tokenProvider
        self.loggingEnabled = loggingEnabled
    }

    public var baseURL: String {
        switch environment {
        case .development:
            return "http://191.164.5.4:3000/quickkomm/v1"
        case .staging:
            return "https://stage.api.com"
        case .production:
            return "https://api.com"
        case .simulator:
            return "http://localhost:3000/quickkomm/v1"
        }
    }

    public var commonHeaders: [String: String] {
        var headers: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        if let token = tokenProvider.accessToken {
            headers["Authorization"] = "Bearer \(token)"
        }

        return headers
    }
}
