//
//  SearchTextField.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//

import SwiftUI

struct SearchTextField: View {
    
    @State private var searchedText: String = ""
    var placeholder: String = ""
    var body: some View {
        
        HStack {
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            TextField("Search", text: $searchedText)
                .font(.customfont(.regular, fontSize: 16))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundStyle(.textTitle)
               
        }
        .frame(height: 30)
        .padding(15)
        .background(.searchbox)
        .cornerRadius(16)
    }
}

#Preview {
    SearchTextField(placeholder: "Search")
}
