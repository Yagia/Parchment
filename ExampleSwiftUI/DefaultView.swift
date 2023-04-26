import Parchment
import SwiftUI
import UIKit

struct DefaultView: View {
    var body: some View {
        PageView {
            Page { _ in
                Image(systemName: "star.fill")
                    .padding()
            } content: {
                Text("Page 1")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 2") {
                Text("Page 2")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 3") {
                Text("Page 3")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 4") {
                Text("Page 4")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Some very long title") {
                Text("Page 5")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 6") {
                Text("Page 6")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 7") {
                Text("Page 7")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
    }
}
