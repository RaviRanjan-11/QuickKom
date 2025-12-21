//
//  ExploreView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//



import SwiftUI

struct ExploreView: View {
    
    
    @StateObject var viewModel: ExploreViewModel = ExploreViewModel()
    var body: some View {
        
        
        ZStack {
            
            VStack {
                
                Text("Find Products")
                    .font(.customfont(.semibold, fontSize: 20))
                    
                SearchTextField(placeholder: "Search Store")
                    .padding(.horizontal)
                    .padding(.top)
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

