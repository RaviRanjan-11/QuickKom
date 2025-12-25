//
//  ItemCardView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 12/12/25.
//

import SwiftUI

struct ItemCardView: View {
    
    let item: Product
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            RemoteImageView(imageURL: item.thumbnail ?? "app_logo") { image in
                
                (image ?? Image("app_logo"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                    .cornerRadius(10)
                
            }
            
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(item.name)
                    .font(.customfont(.semibold, fontSize: 16))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(item.stockQuantity.toString() + " left")
                    .font(.customfont(.semibold, fontSize: 15))
                    .foregroundStyle(.textTitle)
                
                HStack {
                    Text(item.pricing.basePrice.toString() + " ₹")
                        .font(.customfont(.semibold, fontSize: 18))
                    Spacer()
                    
                    Button {
                        // action
                    } label: {
                        Image("add")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                    }
                    .frame(width: 40, height: 40)
                    .background( Color.primaryColor)
                    .cornerRadius(15)
                    
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(width: UIScreen.main.bounds.width * 0.35, height: 200)
        .cornerRadius(15)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}

//#Preview {
//    ItemCardView(item: pr)
//}


extension Int {
    func toString() -> String {
        return "\(self)"
    }
}
