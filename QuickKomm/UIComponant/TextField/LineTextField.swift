//
//  LineTextField.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 07/12/25.
//

import SwiftUI



struct LineTextField: View {
    @State var title: String = "Email"
    @State var placeholder: String = ""
    @Binding var text: String
    @State var keyboarType: UIKeyboardType = .default
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $text)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .keyboardType(keyboarType)
                .frame(height: 35)
                .font(.customfont(.regular, fontSize: 15))
            
            Divider()

        }
    }
}

struct SecureLineTextField : View {
    @State var title: String = "Email"
    @State var placeholder: String = ""
    @Binding var text: String
    @State var keyboarType: UIKeyboardType = .default
    @Binding var showPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Group {
                if showPassword {
                    TextField(placeholder, text: $text)
                        .autocapitalization(.none)
                        .modifier(SecureEyeModifier(isShow: $showPassword))
                        .frame(height:35)
                        .font(.customfont(.regular, fontSize: 15))
                } else {
                    SecureField(placeholder, text: $text)
                        .autocapitalization(.none)
                        .modifier(SecureEyeModifier(isShow: $showPassword))
                        .frame(height:35)

                        
                }
            }
            
            Divider()
        }
       
    }
}




struct LineTextField_Previews: PreviewProvider {
    @State static  var txt: String = ""
    static var previews: some View {
        VStack {
            LineTextField(text: $txt)
                .padding(20)
            
            SecureLineTextField(text: $txt, showPassword: .constant(true))
                .padding(20)
        }
    }
    
}
