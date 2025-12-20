//
//  HeroTabContainer.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//

import SwiftUI

struct HeroTabContainer: View {
    
    @State private var selectedTab: HeroTabItems = .shop
    
    var body: some View {
        VStack(spacing: 0) {
            
            Group {
                switch selectedTab {
                case .shop:
                    ShopView()
                case .explore:
                    ExploreView()
                case .cart:
                    CartView()
                case .favorite:
                    FavoriteView()
                case .account:
                    AccountView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HeroTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
        
    }
}
#Preview {
    HeroTabContainer()
}

