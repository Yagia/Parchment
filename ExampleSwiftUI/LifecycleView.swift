import Parchment
import SwiftUI
import UIKit

struct LifecycleView: View {
    var body: some View {
        PageView {
            Page("Title 1") {
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
        }
        .willScroll { item in
            print("will scroll: ", item)
        }
        .didScroll { item in
            print("did scroll: ", item)
        }
        .didSelect { item in
            print("did select: ", item)
        }
    }
}
