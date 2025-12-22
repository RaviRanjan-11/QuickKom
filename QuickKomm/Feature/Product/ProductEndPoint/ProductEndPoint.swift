//
//  ProductEndPoint.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 22/12/25.
//

import Foundation


enum ProductEndPoint: APIEndPoint {
   
    
    case getProducts(categoryId: String)
    
   
}
extension ProductEndPoint {
    
    var path: String {
        switch self {
            
        case .getProducts(categoryId: let categoryId):
            return "/products/category/\(categoryId)"
            
        }
        
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var body: (any Encodable)? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
}
