//
//  HeroTabItems.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//


import SwiftUI


enum HeroTabItems: String, Identifiable, CaseIterable{
    case shop
    case explore
    case cart
    case favorite
    case account
    
    var title: String { self.rawValue.capitalized }
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .shop:
            return "store_tab"
        case .explore:
            return "explore_tab"
        case .cart:
            return "cart_tab"
        case .favorite:
            return "fav_tab"
        case .account:
            return "account_tab"
        }
    }
}