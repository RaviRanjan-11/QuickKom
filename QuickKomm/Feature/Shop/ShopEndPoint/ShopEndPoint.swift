//
//  ShopEndPoint.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 19/12/25.
//

import Foundation


public enum ShopEndpoint: Endpoint {
    
    case fetchHomeWidget
    case fetchProduct(categoryId: String)
    case addToCart(productId: String)
}


extension ShopEndpoint {

    public var path: String {
        switch self {
        case .fetchHomeWidget:
            return "/item-categories/home-widget"
        case .fetchProduct:
            return "/item-categories"
        case .addToCart:
            return "cart/add"
        }
    }

    public var method: HTTPMethod {
        switch self {
        case .addToCart:
            return .post
        default:
            return .get
        }
    }

    public var queryItems: [URLQueryItem]? {
        switch self {
        case .fetchProduct(let categoryId):
            return [
                URLQueryItem(name: "categoryId", value: categoryId)
            ]
        default:
            return nil
        }
    }

    public var body: Encodable? {
        switch self {
        case .addToCart(let productId):
            return AddToCartRequest(productId: productId)
        default:
            return nil
        }
    }
}


struct AddToCartRequest: Encodable {
    let productId: String
}

