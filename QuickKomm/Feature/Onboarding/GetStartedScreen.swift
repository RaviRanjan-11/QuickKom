//
//  GetStartedScreen.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 03/12/25.
//

import SwiftUI

struct GetStartedScreen: View {
    
    var body: some View {
        
        ZStack {
            
            
            Image("welcom_bg")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack  {
                
                Spacer()
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)

                Text("Welcome \nto our store")
                    .foregroundStyle(.white)
                    .font(.customfont(.semibold, fontSize: 48))
                    .multilineTextAlignment(.center)

                
            
                Text("Ger your groceries in as fast as one hour")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                NavigationLink {
                    LoginScreen()
                } label: {
                    PrimaryButton(title: "Get Started")
                    .cornerRadius(20)
                    .padding(.horizontal, 16)
                    .foregroundStyle(.white)
                    .padding(16)
                   
                }

            }
            
        }
    }
}

#Preview {
    NavigationView{
        GetStartedScreen()
    }
}
