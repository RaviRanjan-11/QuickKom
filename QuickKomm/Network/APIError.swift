//
//  APIError.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


import Foundation
public enum APIError: Error, LocalizedError {
    case invalidURL
    case decodingError
    case serverError(Int)
    case unknown(Error)
    case noData
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .decodingError: return "Failed to decode response."
        case .serverError(let code): return "Server error with code: \(code)"
        case .unknown(let err): return err.localizedDescription
        case .noData: return "No data returned from server."
        }
    }
}
