import Parchment
import SwiftUI
import UIKit

struct ChangeItemsView: View {
    @State var isToggled: Bool = false

    var body: some View {
        PageView {
            if isToggled {
                Page("Title 2") {
                    VStack {
                        Text("Page 2")
                            .font(.largeTitle)
                            .padding(.bottom)

                        Button("Click me") {
                            isToggled.toggle()
                        }
                    }
                }

                Page("Title 3") {
                    VStack {
                        Text("Page 3")
                            .font(.largeTitle)
                            .padding(.bottom)

                        Button("Click me") {
                            isToggled.toggle()
                        }
                    }
                }
            } else {
                Page("Title 0") {
                    VStack {
                        Text("Page 0")
                            .font(.largeTitle)
                            .padding(.bottom)

                        Button("Click me") {
                            isToggled.toggle()
                        }
                    }
                }

                Page("Title 1") {
                    VStack {
                        Text("Page 1")
                            .font(.largeTitle)
                            .padding(.bottom)

                        Button("Click me") {
                            isToggled.toggle()
                        }
                    }
                }
            }
        }
    }
}
