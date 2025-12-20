//
//  DotLoaderView.swift
//  QuickKomm
//
//  Created by Ravi Ranjan on 17/12/25.
//

import SwiftUI
struct DotLoaderView: View {
    
    @State private var activeIndex = 0
    let dotCount = 3

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<dotCount, id: \.self) { index in
                Circle()
                    .fill(Color.primaryColor)
                    .frame(width: 10, height: 10)
                    .opacity(activeIndex == index ? 1 : 0.3)
                    .scaleEffect(activeIndex == index ? 1.2 : 1)
            }
        }
        .onAppear {
            startAnimation()
        }
    }

    private func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.25)) {
                activeIndex = (activeIndex + 1) % dotCount
            }
        }
    }
}


#Preview {
    DotLoaderView()
}
