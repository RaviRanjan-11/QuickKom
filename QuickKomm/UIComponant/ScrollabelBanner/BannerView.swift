//
//  BannerView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 12/12/25.
//

import SwiftUI


struct BannerItem: Identifiable {
    let id = UUID()
    let imageName: String
}

struct BannerCardView: View {
    let item: BannerItem
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
            
                
        }
        .frame(height: 120)
        .cornerRadius(20)

    }
}

#Preview {
    let item = BannerItem(imageName: "banner_top")
    BannerCardView(item: item)
}
