//
//  AppDefaults.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 26/12/25.
//

import Foundation
import SwiftUI

enum AppDefaults {

    @AppStorage(UserDefaultKey.userId.key)
    static var userId: String = ""
    
    @AppStorage(UserDefaultKey.userName.key)
    static var userName: String = ""
    
    @AppStorage(UserDefaultKey.fullName.key)
    static var fullName: String = ""
    
    @AppStorage(UserDefaultKey.email.key)
    static var email: String = ""
    
    @AppStorage(UserDefaultKey.token.key)
    static var token: String = ""
    
    @AppStorage(UserDefaultKey.refreshToken.key)
    static var refreshToken: String = ""
 
}

