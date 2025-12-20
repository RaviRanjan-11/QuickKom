//
//  Notification.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 09/12/25.
//

import Foundation
import UIKit

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
