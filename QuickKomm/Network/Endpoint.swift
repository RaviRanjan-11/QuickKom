//
//  Endpoint.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


import Foundation

public protocol Endpoint {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
}



public extension Endpoint {

    var headers: [String: String]? {
        nil
    }

    var queryItems: [URLQueryItem]? {
        nil
    }

   
}
