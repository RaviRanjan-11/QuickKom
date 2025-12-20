//
//  HomeWidgetResponse.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 19/12/25.
//



struct HomeWidgetResponse: Codable {
    let success: Bool
    let data: [HomeWidgetData]
}

// MARK: - Datum
struct HomeWidgetData: Codable, Identifiable {
    let displayOrder: Int
    let id, title: String
    let departmentID: DepartmentID
    let thumbnail: String
    let icon: String
    let isActive, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int
    let isHomeWidget: Bool

    enum CodingKeys: String, CodingKey {
        case displayOrder
        case id = "_id"
        case title
        case departmentID = "departmentId"
        case thumbnail, icon, isActive, isDeleted, createdAt, updatedAt
        case v = "__v"
        case isHomeWidget
    }
}

// MARK: - DepartmentID
struct DepartmentID: Codable {
    let id, title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
    }
}
