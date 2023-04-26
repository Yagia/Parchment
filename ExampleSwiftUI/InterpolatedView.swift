import Parchment
import SwiftUI
import UIKit

struct InterpolatedView: View {
    var body: some View {
        PageView {
            Page { state in
                Image(systemName: "star.fill")
                    .scaleEffect(x: 1 + state.progress, y: 1 + state.progress)
                    .rotationEffect(Angle(degrees: 180 * state.progress))
                    .padding(30 * state.progress + 20)
            } content: {
                Text("Page 1")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }
            Page { state in
                Text("Rotate")
                    .fixedSize()
                    .rotationEffect(Angle(degrees: 90 * state.progress))
                    .padding(.horizontal, 10)
            } content: {
                Text("Page 2")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }
            
            Page { state in
                Text("Tracking")
                    .tracking(10 * state.progress)
                    .fixedSize()
                    .padding()
            } content: {
                Text("Page 3")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }

            Page { state in
                Text("Growing")
                    .fixedSize()
                    .padding(.vertical)
                    .padding(.horizontal, 20 * state.progress + 10)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(6)
            } content: {
                Text("Page 4")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }

            Page("Normal") {
                Text("Page 5")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }

            Page("Normal") {
                Text("Page 6")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
            }
        }
        .menuItemSize(.selfSizing(estimatedWidth: 100, height: 80))
    }
}
