//
//  RemoteImageView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 21/12/25.
//

import SwiftUI

struct RemoteImageView<Content: View>: View {
    @StateObject private var viewModel: RemoteImageLoader
    private let content: (Image?) -> Content

    init(imageURL: String, @ViewBuilder content: @escaping (Image?) -> Content) {
        _viewModel = StateObject(wrappedValue: RemoteImageLoader(imageURL: imageURL))
        self.content = content
    }

    var body: some View {
        content(viewModel.image)
            .onAppear { viewModel.loadImage() }
            .onDisappear { viewModel.cancel() }
    }
    
}
#Preview {
    
    RemoteImageView(imageURL: "https://res.cloudinary.com/dkm654ciu/image/upload/v1766001040/products/Screenshot_2025_12_18_at_12_1766001037969_q65jpd.png") {_ in }
}
