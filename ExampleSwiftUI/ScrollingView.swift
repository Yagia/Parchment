import Parchment
import SwiftUI
import UIKit

struct ScrollingView: View {
    var body: some View {
        PageView {
            Page("First") {
                ScrollingContentView()
            }
            Page("Second") {
                ScrollingContentView()
            }
            Page("Third") {
                ScrollingContentView()
            }
        }
    }
}

struct ScrollingContentView: View {
    var body: some View {
        List {
            ForEach(0...50 , id: \.self) { item in
                NavigationLink(destination: Text("\(item)")) {
                    Text("\(item)")
                }
            }
        }
    }
}
