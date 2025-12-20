//
//  NetworkEnvironment.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


public enum NetworkEnvironment {
    case development
    case staging
    case production
    case simulator
}


public protocol NetworkConfiguration {
    var environment: NetworkEnvironment { get }
    var baseURL: String { get }
    var commonHeaders: [String: String] { get }
}
