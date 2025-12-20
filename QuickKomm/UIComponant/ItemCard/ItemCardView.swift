//
//  ItemCardView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 12/12/25.
//

import SwiftUI


struct ItemCard {
    
    let image: String
    let title: String
    let quantity:String
    let price:String
}
struct ItemCardView: View {

    let item: ItemCard

    var body: some View {
        
        VStack(spacing: 8) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(item.title)
                    .font(.customfont(.semibold, fontSize: 25))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(item.quantity)
                    .font(.customfont(.semibold, fontSize: 15))
                    .foregroundStyle(.textTitle)
                
                HStack {
                    Text(item.price)
                        .font(.customfont(.semibold, fontSize: 20))
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
            .frame(maxWidth: .infinity)  // fill horizontal space
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

#Preview {
    ItemCardView(item: ItemCard(image: "diet_coke", title: "Diet Coke", quantity: "330 Ml", price: "1.99$"))
}
