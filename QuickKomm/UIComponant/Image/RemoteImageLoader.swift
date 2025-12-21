//
//  RemoteImageLoader.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 21/12/25.
//

import Foundation
import SwiftUI
import Combine

final class RemoteImageLoader: ObservableObject {

    @Published var image: Image?

    private let imageURL: URL?
    private var dataTask: URLSessionDataTask?

    init(imageURL: String) {
        self.imageURL = URL(string: imageURL)
    }

    func loadImage() {
        guard image == nil, let imageURL else { return }

        if let cachedImage = ImageCache.shared.getCachedImage(forKey: imageURL.absoluteString) {
            DispatchQueue.main.async {
                self.image = Image(uiImage: cachedImage)
            }
            return
        }

        dataTask = URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, _ in
            guard let self, let data, let downloadedImage = UIImage(data: data)
            else { return }

            ImageCache.shared.saveImage(downloadedImage, forKey: imageURL.absoluteString)
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: downloadedImage)
            }
        }

        dataTask?.resume()
    }

    func cancel() {
        dataTask?.cancel()
        dataTask = nil
    }
}
