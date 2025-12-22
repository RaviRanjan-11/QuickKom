//
//  ExploreView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//



import SwiftUI

struct ExploreView: View {
    
    
    @StateObject var viewModel: ExploreViewModel = ExploreViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 40)
    ]
    var body: some View {
        
        
        ZStack {
            
            NavigationLink(destination: ProductsView(categoryId: viewModel.selectedCategoryId ?? ""), isActive: $viewModel.naviagteToProduct) {
                EmptyView()
            }
            
            VStack {
                
                Text("Find Products")
                    .font(.customfont(.semibold, fontSize: 20))
                    
                SearchTextField(placeholder: "Search Store")
                    .padding(.horizontal)
                    .padding(.top)
                
                
                
                ScrollView( showsIndicators: false) {
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        ForEach(viewModel.categoriesData){ category in
                            CategoryCard(categoryImageUrl: category.thumbnail, categoryTitle: category.title) {
                                viewModel.naviagteToProduct = true
                                viewModel.selectedCategoryId = category.id
                            }
                            .cornerRadius(20)
                        }
                    }
                    .padding(20)
                    
                }
               
            }
            
            
        }
        .task {
            await viewModel.fetchCategories()
        }
        
        
        
    }
    
    
    @ViewBuilder
    private var getView : some View {
        
        VStack {
            
            Text("Explore")
                .font(.largeTitle)
                .padding()
        }
    }
}



#Preview {
    ExploreView()
}

