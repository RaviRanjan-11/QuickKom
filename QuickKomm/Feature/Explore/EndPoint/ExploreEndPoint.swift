//
//  ExploreEndPoint.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 22/12/25.
//

import Foundation


enum ExploreEndPoint: APIEndPoint {
    
    case getCategories
    
    
}

extension ExploreEndPoint {
    
    var method: HTTPMethod {
        switch self {
        case .getCategories:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCategories:
            return "/item-categories"
        }
    }
    
    var body: (any Encodable)? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        [
            URLQueryItem(name: "isActive", value: "true")
        ]
    }
    
    
}
