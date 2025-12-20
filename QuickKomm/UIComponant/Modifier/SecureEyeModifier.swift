//
//  SecureEyeModifier.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import SwiftUI

struct SecureEyeModifier: ViewModifier {
    
    @Binding var isShow: Bool
    
    public func body(content: Content) -> some View {
        
        HStack {
            content
            Button {
                isShow.toggle()
            } label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill" )
                    .foregroundColor(.textTitle)
            }

        }
    }
}

#Preview {
    TextField("Password", text: .constant("123456"))
        .modifier(SecureEyeModifier(isShow: .constant(true)))
        .padding()
}
