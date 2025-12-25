//
//  CartItemCard.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 24/12/25.
//

import SwiftUI

struct CartItemCard: View {
    
    var imageurl: String = ""
    var body: some View {
        
        
        ZStack {
            
            VStack(alignment: .leading) {
                
                HStack {
                    productImage
                    Text("Guava Honeny chilly")
                }
            }
        }
        
        
    }
    @ViewBuilder
    private var productImage: some View {
        RemoteImageView(imageURL: imageurl) { image in
            (image ?? Image("app_logo"))
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
        }
    }
}

#Preview {
    CartItemCard(imageurl: "")
}
