import Parchment
import SwiftUI
import UIKit

struct SelectedIndexView: View {
    @State var selectedIndex: Int = 0

    var body: some View {
        PageView(selectedIndex: $selectedIndex) {
            Page("Title 0") {
                VStack {
                    Text("Page 0")
                        .font(.largeTitle)
                        .padding(.bottom)

                    Button("Click me") {
                        selectedIndex = 2
                    }
                }
            }

            Page("Title 1") {
                Text("Page 1")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 2") {
                VStack {
                    Text("Page 2")
                        .font(.largeTitle)
                        .padding(.bottom)

                    Button("Click me") {
                        selectedIndex = 0
                    }
                }
            }
        }
    }
}
