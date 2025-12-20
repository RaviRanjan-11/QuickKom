//
//  UserDefaultConstant.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 20/12/25.
//

import Foundation

enum UserDefaultKey {
    case token
    case userId
    case isLoggedIn
    case isfirstTimeLaunch
    case userName
    case fullName
    case email
    case phoneNumber
    case refreshToken
    
    
   var key: String {
        switch self {
        case .token:
            return "token"
        case .userId:
            return "userId"
        case .isLoggedIn:
            return "isLoggedIn"
        case .isfirstTimeLaunch:
            return "isfirstTimeLaunch"
        case .userName:
            return "userName"
        case .fullName:
            return "fullName"
        case .email:
            return "email"
        case .phoneNumber:
            return "phoneNumber"
        case .refreshToken:
            return "refreshToken"
        }
    }
}
