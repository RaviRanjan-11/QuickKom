//
//  DefaultNetworkConfiguration.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//

import Foundation


public final class DefaultNetworkConfiguration: NetworkConfiguration {

    public let environment: NetworkEnvironment
    private let tokenProvider: AuthTokenProvider

    public init(
        environment: NetworkEnvironment,
        tokenProvider: AuthTokenProvider
    ) {
        self.environment = environment
        self.tokenProvider = tokenProvider
    }

    public var baseURL: String {
        switch environment {
        case .development:
            return "http://192.168.1.4:3000/quickkomm/v1"
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
