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
            return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2OTQ2NWY2M2U0NWY0ZTU5MjRhM2FlYzMiLCJlbWFpbCI6ImFkbWluQHF1aWNrLmNvbSIsInVzZXJOYW1lIjoiQWRtaW4iLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NjY0MjAyODgsImV4cCI6MTc2NjY3OTQ4OH0.geNGLqhAWQR9dqQxarHnUrfQXplxCOsTsKFsz85FfGM"
        }
        return token
    }
}
