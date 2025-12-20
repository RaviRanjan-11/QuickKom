//
//  ScrollableBanner.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 12/12/25.
//

import SwiftUI

struct ScrollableBanner: View {

    let banners: [BannerItem]
    @State private var currentIndex = 0
    @Namespace private var animation

    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(banners.indices, id: \.self) { i in
                    BannerCardView(item: banners[i])
                        .tag(i)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            
            HStack(spacing: 10) {
                ForEach(banners.indices, id: \.self) { i in
                    ZStack {
                        if currentIndex == i {
                            Capsule()
                                .fill(Color.primaryColor)
                                .matchedGeometryEffect(id: "indicator", in: animation)
                                .frame(width: 22, height: 8)
                                .transition(.scale.combined(with: .opacity))
                        } else {
                            Circle()
                                .fill(Color.textTitle)
                                .frame(width: 6, height: 6)
                        }
                    }
                    .animation(.spring(response: 0.4, dampingFraction: 0.55, blendDuration: 0.5),
                               value: currentIndex)
                }
            }
            .padding(.bottom, 10)
        }
        .frame(height: 125)
    }
}



#Preview {
    ScrollableBanner(banners: [BannerItem(imageName: "banner_top"), BannerItem(imageName: "banner_top"), BannerItem(imageName: "banner_top")])
        .padding(.horizontal)
}
