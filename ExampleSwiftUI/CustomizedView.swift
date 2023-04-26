import Parchment
import SwiftUI
import UIKit

struct CustomizedView: View {
    var body: some View {
        PageView {
            Page("Title 1") {
                VStack(spacing: 25) {
                    Text("Page 1")
                    Image(systemName: "arrow.down")
                }
                .font(.largeTitle)
            }

            Page("Title 2") {
                VStack(spacing: 25) {
                    Image(systemName: "arrow.up")
                    Text("Page 2")
                }
                .font(.largeTitle)
            }
        }
        .menuItemSize(.fixed(width: 100, height: 60))
        .menuItemSpacing(20)
        .menuItemLabelSpacing(30)
        .selectedColor(.blue)
        .foregroundColor(.black)
        .menuBackgroundColor(.white)
        .backgroundColor(.white)
        .selectedBackgroundColor(.white)
        .menuInsets(.vertical, 20)
        .menuHorizontalAlignment(.center)
        .menuPosition(.bottom)
        .menuTransition(.scrollAlongside)
        .menuInteraction(.swipe)
        .contentInteraction(.scrolling)
        .contentNavigationOrientation(.vertical)
        .selectedScrollPosition(.preferCentered)
        .indicatorOptions(.visible(height: 4))
        .indicatorColor(.blue)
        .borderOptions(.visible(height: 4))
        .borderColor(.blue.opacity(0.2))
    }
}
