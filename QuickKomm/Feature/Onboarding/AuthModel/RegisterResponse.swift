//
//  RegisterResponse.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 08/12/25.
//


// MARK: - RegisterResponse
struct AuthResponse: Codable {
    let success: Bool
    let data: AuthResponseData?
    let error: String?
    let statusCode: Int?
}

// MARK: - DataClass
struct AuthResponseData: Codable {
    let id, email, userName, name: String?
    let accessToken, refreshToken: String?
    
}
