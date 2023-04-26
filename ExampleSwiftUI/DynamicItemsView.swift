import Parchment
import SwiftUI
import UIKit

struct DynamicItemsView: View {
    @State var items: [Int] = [0, 1, 2, 3, 4]

    var body: some View {
        PageView(items, id: \.self) { item in
            Page("Title \(item)") {
                VStack {
                    Text("Page \(item)")
                        .font(.largeTitle)
                        .padding(.bottom)

                    Button("Click me") {
                        if items.count > 2 {
                            items = [5, 6]
                        } else {
                            items = [0, 1, 2, 3, 4]
                        }
                    }
                }
            }
        }
    }
}
