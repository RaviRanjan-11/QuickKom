//
//  ProductResponse.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 19/12/25.
//

import Foundation

struct Product: Codable {
    let id, name, description, shortDescription: String
    let sku: String
    let itemCategory: ItemCategory
    let images: [String]
    let thumbnail: String
    let videos: [String]
    let pricing: Pricing
    let variants: [String]
    let hasVariants: Bool
    let stockQuantity, lowStockThreshold: Int
    let stockStatus: String
    let trackInventory, allowBackorder: Bool
    let condition: String
    let tags, collections: [String]
    let averageRating, totalReviews, totalSales: Int
    let isActive, isPublished, isFeatured, isNewArrival: Bool
    let isBestSeller: Bool
    let includedItems, relatedProducts: [String]
    let createdAt, updatedAt: String
}

// MARK: - ItemCategory
struct ItemCategory: Codable {
    let id, title: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
    }
}

// MARK: - Pricing
struct Pricing: Codable {
    let basePrice: Int
    let currency: String
    let taxInclusive: Bool
}
