//
//  RegistrationViewModel.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import Foundation
import Combine


class RegistrationViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var navigateToLogin = false 
    
    func register() async {
        
        let result = validateFields(
            email: email,
            password: password,
            userName: userName,
            name: name
        )
        
        
        if !result.isValid {
            showAlert = true
            alertMessage = result.error?.message ?? "Unknown error"
            return
        }
        await registerAPIcall()
        
        
    }
    
    func registerAPIcall() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response: AuthResponse = try await NetworkManager.shared.request(
                AuthEndpoint.register(
                    name: name,
                    email: email,
                    password: password,
                    userName: userName
                    
                )
            )
            
            print("User registered: \(response)")
            self.navigateToLogin = true
            
            
        } catch {
            print("Registration error: \(error)")
            self.alertMessage = error.localizedDescription
            self.showAlert = true
        }
        
        isLoading = false
    }
    
    func validateFields(email: String, password: String, userName: String, name: String )
    -> (isValid: Bool, error: ValidationError?) {
        
        if userName.isEmpty {
            return (false, .emptyUserName)
        }
        
        if name.isEmpty {
            return (false, .emptyName)
        }
        
        if email.isEmpty {
            return (false, .emptyEmail)
        }
        
        if !email.contains("@") {
            return (false, .invalidEmail)
        }
        
        if password.isEmpty {
            return (false, .emptyPassword)
        }
        
        if password.count < 6 {
            return (false, .weakPassword)
        }
        
        return (true, nil)
    }

}

enum ValidationError: Error {
    case emptyEmail
    case invalidEmail
    case emptyPassword
    case weakPassword
    case emptyUserName
    case emptyName
    
    var message: String {
        switch self {
        case .emptyEmail: return "Email cannot be empty"
        case .invalidEmail: return "Please enter a valid email address"
        case .emptyPassword: return "Password cannot be empty"
        case .weakPassword: return "Password must be at least 6 characters"
        case .emptyUserName: return "Username cannot be empty"
        case .emptyName: return "Name cannot be empty"
        }
    }
}

