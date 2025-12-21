//
//  Endpoint.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


import Foundation

public protocol APIEndPoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? {get}
}
