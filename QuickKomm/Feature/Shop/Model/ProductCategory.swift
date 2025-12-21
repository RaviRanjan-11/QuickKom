//
//  ProductCategory.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 20/12/25.
//

import Foundation

struct ProductCategory: Identifiable {
    let id: String
    let name: String
    var products: [Product]
}
