//
//  SectionView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 12/12/25.
//

import SwiftUI

struct SectionView: View {
    
    let title: String
    let actionTitle: String
    var action:() -> Void
    var body: some View {
        
        HStack {
            Text(title)
                .font(.customfont(.bold, fontSize: 25))
            
            Spacer()
            Button {
                action()
            } label: {
                Text(actionTitle)
                    .font(.customfont(.semibold, fontSize: 14))
                    .foregroundStyle(Color.primaryColor)
            }

        }
        .padding(.horizontal)
    }
}

#Preview {
    SectionView(title: "Fresh Now",  actionTitle: "See All",action: {})
}
