//
//  AlertType.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 09/12/25.
//

import Foundation

import SwiftUI


enum AlertType {
    
    
    case information
    
    case error
    
    case warning
    
    case success
    
    var title: String {
        
        switch self {
        case .information:
            return "INFORMATION"
        case .error:
            return "ERROR"
        case .warning:
            return "WARNING"
        case .success:
            return "SUCESS"
        }
    }
    
    
    var backgroundColor: Color {
        switch self {
        case .information:
            return Color.blue
        case .error:
            return Color.red
        case .warning:
            return Color.yellow
        case .success:
            return Color.green
        }
    }
    
    var icon: Image {
        switch self {
        case .information:
            return Image(systemName: "info.circle")
        case .error:
            return Image(systemName: "exclamationmark.circle")
        case .warning:
            return Image(systemName: "exclamationmark.trianglepath.circle")
        case .success:
            return Image(systemName: "checkmark.circle")
                
        }
    }
}
