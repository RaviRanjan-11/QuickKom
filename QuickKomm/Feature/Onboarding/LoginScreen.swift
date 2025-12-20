//
//  LoginScreen.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 06/12/25.
//

import SwiftUI

struct LoginScreen: View {
    
    var body: some View {
        ZStack {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
            VStack {
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                Spacer()
                
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    Text( "Get your groceries\nwith Foodle")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        
                        Text("Continue With Email Login")
                            .font(Font.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.blueBackground)
                    .cornerRadius(20)
                    .padding(.bottom, 8 )
                    
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        
                        Text("Continue With Email Registration")
                            .font(Font.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.primaryColor)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    Divider()
                        .padding(.bottom, 25)
                    
                    Text( "Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundStyle(Color.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom , 25)
                    
                    Button {
                        
                    } label: {
                        
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    
                    .background(Color.blueBackground)
                    .cornerRadius(20)
                    .padding(.bottom, 8 )


                    
                    Button {} label: {
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continue with Facebook")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color.primaryColor)
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .screenWidth * 0.8)


            }
            
            
        }
        .ignoresSafeArea()
        
    }
    
}

#Preview {
    LoginScreen()
}
