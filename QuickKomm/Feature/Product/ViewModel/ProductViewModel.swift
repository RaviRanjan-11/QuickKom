//
//  ProductViewModel.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 22/12/25.
//

import Foundation

import Combine


@MainActor
final class ProductViewModel: ObservableObject {
    
    
    @Published private(set)  var products: [Product] = []
    @Published private(set)  var isLoading: Bool = false
    @Published private(set)  var errorMessage: String? = nil
    
    func fetchProducts(by categoryid: String) async {
        
        
        
        await execute {
            
            let endpoint : ProductEndPoint = .getProducts(categoryId: categoryid)
            
            do {
                
                let data : ProductResponse = try await NetworkManager.shared.request(endpoint)
                
                print(data)
                
                self.products = data.productData.data
            }
            catch {
                print(error.localizedDescription)
            }

        }
        
        
    }
    
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
