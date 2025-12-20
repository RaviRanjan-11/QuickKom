//
//  AppDefaults.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 20/12/25.
//

import Foundation
struct AppDefaults {

    @UserStorage(key: .isLoggedIn, defaultValue: false)
    static var isLoggedIn: Bool

    @UserStorage(key: .userId, defaultValue: "")
    static var userId: String

    @UserStorage(key: .userName, defaultValue: "")
    static var userName: String

    @UserStorage(key: .fullName, defaultValue: "")
    static var fullName: String

    @UserStorage(key: .email, defaultValue: "")
    static var email: String

    @UserStorage(key: .token, defaultValue: "")
    static var token: String

    @UserStorage(key: .refreshToken, defaultValue: "")
    static var refreshToken: String
}
