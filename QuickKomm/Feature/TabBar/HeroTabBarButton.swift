//
//  HeroTabBarButton.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//


import SwiftUI

struct HeroTabBarButton: View {
    
    var item: HeroTabItems
    
    var isSelected: Bool
    
    var onSelect: () -> ()
    
    var body: some View {
        Button {
            onSelect()
        } label: {
            VStack {
                Image(item.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)

                Text(item.title)
                    .font(.customfont(.semibold, fontSize: 14))
            }
            .foregroundStyle(isSelected ? Color.primaryColor : .textTitle)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HeroTabBarButton(item: .account, isSelected: true, onSelect: {})
}
