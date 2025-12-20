//
//  ShopView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//

import SwiftUI

struct ShopView: View {
    @StateObject private var viewmodel: ShopViewModel = ShopViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                
                HStack {
                    Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("Gurgaon, India")
                        .font(.customfont(.semibold, fontSize: 18))
                }
                SearchTextField()
                    .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    ScrollableBanner(banners: [
                        BannerItem(imageName: "banner_top"),
                        BannerItem(imageName: "banner_top"),
                        BannerItem(imageName: "banner_top")
                    ])
                    .padding(.horizontal)
                    
                    ForEach(viewmodel.homeWidget) { section in
                        VStack(alignment: .leading, spacing: 16) {
                            SectionView(title: section.title, actionTitle: "view more") {
                                print("")
                            }
                            .padding(.top)
                            
                            // If you want to show an item for each section,
                            // adapt as needed. For now, we'll just show a placeholder ItemCardView.
                            // If you eventually have an array of items per section, update accordingly.
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    // Replace this with your proper data for each section
                                    ItemCardView(item: ItemCard(
                                        image: section.thumbnail,
                                        title: section.title,
                                        quantity: "1 unit", // or another property if available
                                        price: "$0.00"      // or another property if available
                                    ))
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewmodel.fetchHomeWidget()
        }
    }
}

#Preview {
    ShopView()
}
