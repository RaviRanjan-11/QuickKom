//
//  LoginView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import SwiftUI

struct LoginView: View {
    
    
    @StateObject var viewmodel = LoginViewModel()
    
    var body: some View {
        
        ZStack {
            
            
            NavigationLink(destination: HeroTabContainer().navigationBarBackButtonHidden(), isActive: $viewmodel.navigateToHome) {
                EmptyView()
            }
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView {
                
                
                
                VStack {
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .padding(.bottom, 60)
                    Text("Logging")
                        .font(.customfont(.semibold, fontSize: 26))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    
                    Text("Enter your emails and password")
                        .font(Font.customfont(.regular, fontSize: 15))
                        .foregroundStyle(Color.textTitle)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    
                    
                    
                    LineTextField(title: "Email", placeholder: "Enter your email address", text: $viewmodel.txtEmail)
                        .padding(.top, 25)
                    
                    
                    SecureLineTextField(title:"Password",placeholder: "Enter Your Password",text: $viewmodel.txtPassword, showPassword: $viewmodel.showPassword)
                        .padding(.top, 25)
                    
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        Text("Forgot Password?")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(Color.textTitle)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 5)
                    
                    
                    
                    Button {
                        Task {
                            await viewmodel.login()
                        }
                        
                    } label: {
                        PrimaryButton(title: "Login")
                                .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                                .background( Color.primaryColor)
                                .cornerRadius(20)
                                .padding(.top, 40)
                    }

                    
            
                    
                    NavigationLink {
                        
                        RegistrationView()
                                           
                    } label: {
                        HStack{
                            Text("Don’t have an account?")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.textTitle)
                            
                            Text("Signup")
                                .font(.customfont(.semibold, fontSize: 14))
                                .foregroundColor(.primaryColor)
                        }
                    }
                    .padding()
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, .screenHeight * 0.1)
                
            }
            
            if viewmodel.isLoading {
                Color.black.opacity(0.3)
                DotLoaderView()
            }
            
            if viewmodel.showAlert{
                AlertBox(alertType: .error, info: viewmodel.alertMessage){
                    viewmodel.showAlert = false
                }
                .cornerRadius(20)
            }
        }
        
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
