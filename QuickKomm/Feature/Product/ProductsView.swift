//
//  ProductsView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 22/12/25.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject private var viewmodel: ProductViewModel = ProductViewModel()
    
    var categoryId: String?
    
    init(categoryId: String) {
        self.categoryId = categoryId
        
    }
    
    var body: some View {
        
        
        ZStack {
            
        
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                    
                ]) {
                    ForEach(viewmodel.products) { product in
                        self.categoryItem(for: product)
                    }
                   
                }
                
                
            }
        }
        .task {
            await viewmodel.fetchProducts(by: categoryId ?? "")
        }
        .navigationTitle("Products")
        .navigationBarTitleDisplayMode(.inline)    }
    
    @ViewBuilder
    private func categoryItem(for product: Product) -> some View {
        ItemCardView(item: product)
    }
}

#Preview {
    NavigationView {
        ProductsView(categoryId: "693c6c7baa3437a3261178f2")
            .navigationBarTitleDisplayMode(.inline)
    }
}

