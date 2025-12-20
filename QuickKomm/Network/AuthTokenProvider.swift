//
//  AuthTokenProvider.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 20/12/25.
//

import Foundation
public protocol AuthTokenProvider {
    var accessToken: String? { get }
}


public final class DefaultAuthTokenProvider: AuthTokenProvider {
    public var accessToken: String? {
       let token = UserDefaults.standard.string(forKey: "token")
        if token == nil {
            return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2OTNjNWU3OTk5MjZkYzExMzZjZWY2YWYiLCJlbWFpbCI6ImFkbWluQGFkbWluLmNvbSIsInVzZXJOYW1lIjoiQWRtaW4gSHUiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NjYyMTQ3MDIsImV4cCI6MTc2NjIxODMwMn0.ICvuj-9fNlZFbcTqCGzyKw_DUjsFWrqzWx7coHrfnfs"
        }
        return token
    }
}
