//
//  ProductCategoryModel.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 22/12/25.
//


struct ProductCategoryModel: Codable {
    let success: Bool
    let productCategoryies: ProductCategoryies
    
    enum CodingKeys: String, CodingKey {
        case success
        case productCategoryies = "data"
    }
}

struct ProductCategoryies: Codable {
    let total: Int
    let data: [ProductCategoryData]
    
    enum CodingKeys: String, CodingKey {
        case total
        case data = "items"
    }
}

// MARK: - Datum
struct ProductCategoryData: Codable, Identifiable {
    let displayOrder: Int
    let id, title: String
    let departmentID: ProductCategoryDataDepartmentID
    let thumbnail: String
    let icon: String
    let isActive, isDeleted: Bool
    let createdAt, updatedAt: String?
    let v: Int?
    let isHomeWidget: Bool

    enum CodingKeys: String, CodingKey {
        case displayOrder
        case id
        case title
        case departmentID = "departmentId"
        case thumbnail, icon, isActive, isDeleted, createdAt, updatedAt
        case v = "__v"
        case isHomeWidget
    }
}

// MARK: - DepartmentID
struct ProductCategoryDataDepartmentID: Codable {
    let id, title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
    }
}
