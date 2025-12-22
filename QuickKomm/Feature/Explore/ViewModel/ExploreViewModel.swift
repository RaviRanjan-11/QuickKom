//
//  ExploreViewModel.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 22/12/25.
//

import Foundation
import Combine


final class ExploreViewModel: ObservableObject {
    
    @Published private(set) var categoriesData: [ProductCategoryData] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String? = nil
    @Published var naviagteToProduct: Bool = false
    @Published var selectedCategoryId: String? = nil

    init() {}
    
    func fetchCategories() async {
        
        await execute {
            let productCategoryModelData : ProductCategoryModel = try await NetworkManager.shared.request(ExploreEndPoint.getCategories)
            
            self.categoriesData = productCategoryModelData.productCategoryies.data
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
