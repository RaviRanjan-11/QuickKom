//
//  ShopViewModel.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 18/12/25.
//

import Foundation
import Combine

@MainActor
final class ShopViewModel: ObservableObject {
    
    @Published private(set) var homeWidget: [HomeWidgetData] = []
    @Published private(set) var products: [Product] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    func fetchHomeWidget() async {
        await execute {
            let response: HomeWidgetResponse =
            try await NetworkManager.shared.request(
                ShopEndpoint.fetchHomeWidget
            )
            self.homeWidget = response.data
        }
    }
    
    func fetchProducts(categoryId: String) async {
        await execute {
            self.products = try await NetworkManager.shared.request(
                ShopEndpoint.fetchProduct(categoryId: categoryId)
            )
        }
    }
    
    func addToCart(productId: String) async {
        //        await execute {
        //            let _: AddToCartResponse = try await NetworkManager.shared.request(
        //                ShopEndpoint.addToCart(productId: productId)
        //            )
        //        }
    }
    
    private func execute(
        _ operation: @escaping () async throws -> Void
    ) async {
        isLoading = true
        errorMessage = nil
        
        do {
            try await operation()
        } catch let error as APIError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
