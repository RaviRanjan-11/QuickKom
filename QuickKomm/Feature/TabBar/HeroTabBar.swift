//
//  HeroTabBar.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 10/12/25.
//

import SwiftUI

struct HeroTabBar: View {
    
    @Binding var selectedTab: HeroTabItems
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(HeroTabItems.allCases, id: \.self) { item in
                    HeroTabBarButton(
                        item: item,
                        isSelected: selectedTab == item
                    ) {
                        selectedTab = item
                    }
                }
            }
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
    }
}


#Preview {
    HeroTabBar(selectedTab: .constant(.account))
}
