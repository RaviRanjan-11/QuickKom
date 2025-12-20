//
//  Keyboard.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 09/12/25.
//

import Foundation


import Combine
import UIKit

class Keyboard: ObservableObject {
    
    @Published var isVisible: Bool = false
    
    @Published var height: CGFloat = 0
    
    private var cancellable: AnyCancellable?

    
    init() {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0 }
        
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        cancellable = Publishers.Merge(willShow, willHide)
            .assign(to: \.height, on: self)
    }
    
}
