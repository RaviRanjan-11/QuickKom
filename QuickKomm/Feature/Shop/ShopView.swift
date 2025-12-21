//
//  ShopView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//

import SwiftUI
import SwiftUI

struct ShopView: View {
    
    @StateObject private var viewModel = ShopViewModel()

    var body: some View {
        ZStack {
            VStack {
                headerView
                SearchTextField()
                    .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    bannerView
                    categorySections
                }
            }
            .disabled(viewModel.isLoading)
            
            
            if(viewModel.isLoading) {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                DotLoaderView()
            }
        }
        .task {
            await viewModel.loadHomeData()
        }
    }
    
    // MARK: - Header
    @ViewBuilder
    private var headerView: some View {
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
    }
    
    // MARK: - Banners
    @ViewBuilder
    private var bannerView: some View {
        ScrollableBanner(banners: [
            BannerItem(imageName: "banner_top"),
            BannerItem(imageName: "banner_top"),
            BannerItem(imageName: "banner_top")
        ])
        .padding(.horizontal)
    }
    
    // MARK: - Category Sections
    @ViewBuilder
    private var categorySections: some View {
        ForEach(viewModel.categoryProducts) { category in
            categorySection(for: category)
        }
    }
    
    // MARK: - Single Category Section
    @ViewBuilder
    private func categorySection(for category: ProductCategory) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionView(title: category.name, actionTitle: "View More") {
                print("View more tapped for \(category.name)")
            }
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    if category.products.isEmpty {
                        ProgressView()
                            .frame(width: 100, height: 120)
                    } else {
                        ForEach(category.products) { product in
                            categoryItem(for: product)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    @ViewBuilder
    private func categoryItem(for product: Product) -> some View {
        ItemCardView(item: product)
    }
}

#Preview {
    ShopView()
}
