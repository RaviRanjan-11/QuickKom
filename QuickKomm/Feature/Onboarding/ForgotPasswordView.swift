//
//  ForgotPasswordView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject var viewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    var body: some View {
        
        ZStack {
            
            Image("bottom_bg")
                .resizable()
            
            
            ScrollView {
                
                
                VStack {
                    
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                        .padding(.bottom, 60)

                    Text("Forgot Password")
                        .font(.customfont(.semibold, fontSize: 26))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("Enter your email")
                        .font(.customfont(.semibold, fontSize: 16))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.textTitle)
                        .padding(.top, 10)
                    
                    LineTextField(title: "Email",placeholder: "Enter your email", text: $viewModel.email)
                        .padding(.top, 40)
                    
                    
                    PrimaryButton(title: "Forgot Password")
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color.primaryColor)
                    .cornerRadius(20)
                    .padding(.top, 40)
                    
                    
                }
                .padding(.top, .screenHeight * 0.15)
                .padding(.horizontal, 20)

            }
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ForgotPasswordView()
}
