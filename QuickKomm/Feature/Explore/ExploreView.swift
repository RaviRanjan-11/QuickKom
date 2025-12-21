//
//  ExploreView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 11/12/25.
//



import SwiftUI

struct ExploreView: View {
    
    
    var body: some View {
        
        
        ZStack {
            
            VStack {
                SearchTextField(placeholder: "Search Store")
                    .padding(.horizontal)
            }
            
            
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

