//
//  CategoryCard.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 21/12/25.
//

import SwiftUI

struct CategoryCard: View {

    var categoryImageUrl: String
    var categoryTitle: String

    var body: some View {
        ZStack {
            Color.red.opacity(0.2)

            VStack(spacing: 10) {
                categoryIcon

                Text(categoryTitle)
                    .font(.customfont(.semibold, fontSize: 22))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200) 
        .cornerRadius(20)
    }

    @ViewBuilder
    private var categoryIcon: some View {
        RemoteImageView(imageURL: categoryImageUrl) { image in
            (image ?? Image("app_logo"))
                .resizable()
                .scaledToFit()
                .frame(height: 100)   // width adapts automatically
                .cornerRadius(10)
        }
    }
}


#Preview {
    CategoryCard(categoryImageUrl: "https://res.cloudinary.com/dkm654ciu/image/upload/v1766001040/products/Screenshot_2025_12_18_at_12_1766001037969_q65jpd.png",categoryTitle: "Meats")
}
