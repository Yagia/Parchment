import Parchment
import SwiftUI
import UIKit

struct CustomIndicatorView: View {
    var body: some View {
        PageView {
            Page("Scone") {
                Text("Scone")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Cinnamon Roll") {
                Text("Cinnamon Roll")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Croissant") {
                Text("Croissant")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Muffin") {
                Text("Muffin")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
        .borderColor(.black.opacity(0.1))
        .indicatorOptions(.visible(height: 2))
        .indicatorStyle(SquigglyIndicatorStyle())

    }
}

struct SquigglyIndicatorStyle: PagingIndicatorStyle {
    func makeBody(configuration: Configuration) -> some View {
        SquigglyShape()
            .stroke(.blue, style: StrokeStyle(lineWidth: 3, lineCap: .round))
    }
}

struct SquigglyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)

        for x in stride(from: 0, through: rect.width, by: 1) {
            let sine = sin(x / 1.5)
            let y = rect.height * sine
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}
