//
//  RootView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 20/12/25.
//

import SwiftUI

struct RootView: View {

    @AppStorage(UserDefaultKey.isLoggedIn.key)
    private var isLoggedIn: Bool = false

    var body: some View {
        if isLoggedIn {
            HeroTabContainer()
        } else {
            NavigationView {
                GetStartedScreen()
            }
        }
    }
}

