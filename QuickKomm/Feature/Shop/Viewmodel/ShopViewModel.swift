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
    @Published private(set) var categoryProducts: [ProductCategory] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    // MARK: - Public API

    func loadHomeData() async {
        await execute {
           
            try await self.fetchHomeWidget()
            
            try await self.fetchProductsForCategories()
        }
    }

    // MARK: - Private functions

    private func fetchHomeWidget() async throws {
        let response: HomeWidgetResponse =
            try await NetworkManager.shared.request(ShopEndpoint.fetchHomeWidget)
        self.homeWidget = response.data

        self.categoryProducts = response.data.map {
            ProductCategory(id: $0.id, name: $0.title, products: [])
        }
    }

    private func fetchProductsForCategories() async throws {
        try await withThrowingTaskGroup(of: (String, [Product]).self) { group in
            for category in self.categoryProducts {
                group.addTask {
                    let productResponse: ProductResponse = try await NetworkManager.shared.request(
                        ShopEndpoint.fetchProduct(categoryId: category.id)
                    )
                    return (category.id, productResponse.productData.data)
                }
            }

            for try await (categoryId, products) in group {
                if let index = self.categoryProducts.firstIndex(where: { $0.id == categoryId }) {
                    self.categoryProducts[index].products = products
                }
            }
        }
    }



    // MARK: - Execute wrapper

    private func execute(_ operation: @escaping () async throws -> Void) async {
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
