import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    Text("**Welcome to Parchment**. These examples shows how to use Parchment with SwiftUI. For more advanced examples, see the UIKit examples or reach out on GitHub Discussions.")

                    Section {
                        NavigationLink("Default", destination: DefaultView())
                        NavigationLink("Interpolated", destination: InterpolatedView())
                        NavigationLink("Customized", destination: CustomizedView())
                        NavigationLink("Change selected index", destination: SelectedIndexView())
                        NavigationLink("Lifecycle events", destination: LifecycleView())
                        NavigationLink("Change items", destination: ChangeItemsView())
                        NavigationLink("Dynamic items", destination: DynamicItemsView())
                        NavigationLink("Custom indicator", destination: CustomIndicatorView())
                        NavigationLink("Scrolling Views", destination: ScrollingView())
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
