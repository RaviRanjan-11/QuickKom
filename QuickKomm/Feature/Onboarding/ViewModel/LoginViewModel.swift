//
//  LoginViewModel.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import Foundation
import SwiftUI
import Combine


@MainActor
final class LoginViewModel: ObservableObject {

    @Published var txtEmail: String = "admin@admin.com"
    @Published var txtPassword: String = "mySecurePassword123"
    @Published var isLoading = false
    @Published var showPassword = false
    @Published var errorMessage: String?
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var navigateToHome = false

    func login() async {
        
        let validationResult = validateFields(
            email: txtEmail,
            password: txtPassword
        )

        guard validationResult.isValid else {
            alertMessage = validationResult.error?.message ?? ""
            showAlert = true
            return
        }

        await loginRequest()
    }

    private func loginRequest() async {
        isLoading = true
        errorMessage = nil

        do {

            let endpoint: AuthEndpoint = .login(email: txtEmail, password: txtPassword)
            print("===========================")
            print(endpoint)
            print("===========================")

            let response: AuthResponse = try await NetworkManager.shared.request(endpoint)

            print("User logged in:", response)
            
            AppDefaults.isLoggedIn = true

            AppDefaults.userId = response.data?.id ?? ""
            AppDefaults.userName = response.data?.userName ?? ""
            AppDefaults.fullName = response.data?.name ?? ""
            AppDefaults.email = response.data?.email ?? ""
            AppDefaults.token = response.data?.accessToken ?? ""
            AppDefaults.refreshToken = response.data?.refreshToken ?? ""
            
            
            navigateToHome = true

        } catch {
            alertMessage = error.localizedDescription
            showAlert = true
        }

        isLoading = false
    }

    private func validateFields(
        email: String,
        password: String
    ) -> (isValid: Bool, error: ValidationError?) {

        if email.isEmpty { return (false, .emptyEmail) }
        if !email.contains("@") { return (false, .invalidEmail) }
        if password.isEmpty { return (false, .emptyPassword) }
        if password.count < 6 { return (false, .weakPassword) }

        return (true, nil)
    }
}


