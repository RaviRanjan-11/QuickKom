//
//  PrimaryButton.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 04/12/25.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String

    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.primaryColor)
            .foregroundStyle(.white)
            .cornerRadius(20)
            .font(Font.customfont(.semibold, fontSize: 16))

    }
}

#Preview {
    PrimaryButton(title: "Login")
}
