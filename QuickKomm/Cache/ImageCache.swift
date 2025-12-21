//
//  ImageCache.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 21/12/25.
//

import Foundation
import UIKit
final class ImageCache {
    
    static let shared: ImageCache = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    private init(){}
    
    func getCachedImage(forKey: String) -> UIImage? {
        return cache.object(forKey: forKey as NSString)
    }
    
    func saveImage(_ image: UIImage, forKey: String) {
        cache.setObject(image, forKey: forKey as NSString)
    }
    
}
