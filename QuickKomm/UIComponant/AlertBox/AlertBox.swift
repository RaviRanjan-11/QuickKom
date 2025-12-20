//
//  AlertBox.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 09/12/25.
//

import SwiftUI

struct AlertBox: View {
    var alertType: AlertType = .information
    var info: String = "Hello This inforation is about your request and it is denied due to some reason"
    
    var onDismiss: () -> Void
    
    
    var body: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .regular))
                .opacity(0.6)
            
            
            Color.black.opacity(0.1)
            
            HStack {
                alertType.icon
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(alertType.backgroundColor)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text(alertType.title)
                        .font(.customfont(.semibold, fontSize: 21))
                        .foregroundStyle(alertType.backgroundColor.opacity(0.9))
                        .padding(.bottom, 5)
                    
                    Text(info)
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundStyle(alertType.backgroundColor.opacity(0.9))
                    
                }
                .padding(.horizontal, 10)
                Spacer()
            }
            .padding()
            .background(alertType.backgroundColor.opacity(0.3))
            .cornerRadius(20)
            .padding(.horizontal, 20)
            
        }
        
        .ignoresSafeArea()
        .onTapGesture {
            onDismiss()
        }
    }
}


#Preview {
    AlertBox(onDismiss: {})
}
