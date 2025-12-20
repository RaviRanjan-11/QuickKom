//
//  AuthEndpoint.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


import Foundation

public enum AuthEndpoint: Endpoint {
    
    case login(email: String, password: String)
    case register(name: String, email: String, password: String, userName: String)
}


public extension AuthEndpoint {
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .register:
            return "/auth/register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .login, .register:
            return nil
        }
    }
    
    var body: Encodable? {
        switch self {
        case .login(let email, let password):
            print(email,password.capitalized)
            return LoginRequest(email: email, password: password)
            
        case .register(let name, let email, let password, let userName):
            return RegisterRequest(name: name, email: email, password: password, userName: userName)
        }
    }
}
