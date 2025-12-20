//
//  RegistrationView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel: RegistrationViewModel = RegistrationViewModel()
    
    
    var body: some View {
        
        ZStack {
            
            NavigationLink(
                destination: LoginView()
                    .navigationBarBackButtonHidden(true),
                isActive: $viewModel.navigateToLogin) {
                    EmptyView()
                } 
            
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView(showsIndicators: false){
                
                VStack {
                    
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .padding(.bottom, 60)
                    
                    Text("Registration")
                        .font(.customfont(.semibold, fontSize: 26))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("Enter your credentials to continue")
                        .font(.customfont(.medium, fontSize: 16))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                    
                    
                    LineTextField(title:"Username",placeholder: "Enter your username", text: $viewModel.userName)
                        .padding(.top, 25)
                    
                    LineTextField(title:"Name",placeholder: "Enter your name", text: $viewModel.name)
                        .padding(.top, 25)
                    
                    LineTextField(title: "Email", placeholder: "Enter your email", text: $viewModel.email)
                        .padding(.top, 25)
                    
                    
                    SecureLineTextField(
                        title: "Password",
                        placeholder: "Enter your password",
                        text: $viewModel.password,
                        showPassword: $viewModel.showPassword,
                        
                    )
                    .padding(.top, 25)
                    
                    
                    HStack {
                        Text("By continuing you agree to our")
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundStyle(Color.textTitle)
                        
                        NavigationLink {
                            
                        } label: {
                            
                            HStack {
                                
                                Text("Terms of Service")
                                    .font(.customfont(.regular, fontSize: 14))
                                    .foregroundStyle(Color.primaryColor)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Text("and")
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundStyle(Color.textTitle)
                        
                        NavigationLink {
                            LoginView()
                        } label: {
                            
                            HStack {
                                
                                Text("Privacy Policy")
                                    .font(.customfont(.regular, fontSize: 14))
                                    .foregroundStyle(Color.primaryColor)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    
                    Button {
                        Task {
                            await viewModel.register()
                        }
                    } label: {
                        PrimaryButton(title: "Register")
                    }
                    .frame(minWidth:0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.primaryColor)
                    .cornerRadius(20)
                    .padding(.top, 20)
                    
                    
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundStyle(.textTitle)
                        
                        NavigationLink {
                            
                        } label: {
                            Text("Login")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundStyle(Color.primaryColor)
                            
                        }
                        
                    }
                    .padding(.top, 10)
                    
                }
                .padding(.top, .screenHeight * 0.1)
                
                
            }
            .padding(.horizontal, 20)
            .keyboardAdaptive()
            if viewModel.showAlert {
                
                AlertBox(alertType: .error, info: viewModel.alertMessage){
                    viewModel.showAlert = false
                }
                .cornerRadius(20)
            }
            
            if viewModel.isLoading {
                Color.black.opacity(0.4)
                DotLoaderView()
            }
            
        }
        .navigationBarBackButtonHidden(viewModel.showAlert)
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    RegistrationView()
}
