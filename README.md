<!DOCTYPE html>
<html lang="en">
<body>

<h1>SwiftUI Navigation Example</h1>

<p>This project demonstrates how to implement a custom navigation system using <code>NavigationStack</code> and programmatic navigation in SwiftUI. It allows users to navigate between multiple views while maintaining state and dynamic content.</p>


<h2 id="overview">Overview</h2>

<p>This example project is a SwiftUI app with a custom navigation flow. The app demonstrates how to use a <code>NavigationStack</code> to navigate between views and how to use bindings and enums to manage navigation state.</p>

<h2 id="requirements">Requirements</h2>
<ul>
    <li>iOS 16.0+</li>
    <li>Xcode 14+</li>
    <li>Swift 5.7+</li>
</ul>

<h2 id="getting-started">Getting Started</h2>

<p>Clone the repository to your local machine:</p>

<pre><code>git clone https://github.com/theranjithmenon/swiftui-navigation.git
cd swiftui-navigation
</code></pre>

<p>Open the project in Xcode and run it on a simulator or a physical device.</p>

<h2 id="project-structure">Project Structure</h2>

<p>The project consists of the following files:</p>
<ul>
    <li><code>navigationApp.swift</code>: The main entry point of the app where the navigation stack and app state are defined.</li>
    <li><code>ContentView.swift</code>: Contains the main views (<code>FirstView</code>, <code>SecondView</code>, <code>ThirdView</code>, <code>FourthView</code>), which represent different screens in the app.</li>
    <li><code>NavigationRoutes.swift</code>: Defines the navigation routes and the function to get the destination view based on the route.</li>
</ul>

<h2 id="how-it-works">How It Works</h2>

<h3 id="state-management">State Management</h3>

<p>The app uses two primary pieces of state:</p>

<ol>
    <li>
        <strong>Path</strong> (<code>@State private var path: [NavigationRoutes] = []</code>): This is an array that represents the navigation stack's current state. Each element in the array is a route (of type <code>NavigationRoutes</code>) that represents a specific view in the navigation hierarchy.
    </li>
    <li>
        <strong>AppState</strong> (<code>@State private var appState: AppState = .firstView</code>): This enum tracks the current state of the app, primarily used to manage root-level navigation between <code>FirstView</code> and <code>ThirdView</code>.
    </li>
</ol>

<h3 id="navigation-logic">Navigation Logic</h3>

<p>The app uses a combination of SwiftUI's <code>NavigationStack</code> and programmatic navigation to manage view transitions:</p>

<ul>
    <li><strong>NavigationStack</strong>: A container view that manages the navigation stack, allowing users to navigate between views in a stack-based manner.</li>
    <li><strong>NavigationRoutes Enum</strong>: Defines different possible routes in the app. It conforms to <code>Hashable</code>, which is required for it to be used with the navigation system.</li>
</ul>

<pre><code>enum NavigationRoutes: Hashable {
    case firstView
    case secondView(data: String)
    case thirdView(data: String)
    case fourthView(data: String)
}
</code></pre>

<p><strong>getDestination Function</strong>: A helper function that returns the appropriate view based on the current route.</p>

<pre><code>func getDestination(for route: NavigationRoutes, path: Binding&lt;[NavigationRoutes]&gt;, appState: Binding&lt;AppState&gt;) -> AnyView {
    switch route {
    case .firstView:
        return AnyView(FirstView(path: path))
    case .secondView(let data):
        return AnyView(SecondView(path: path, appState: appState, data: data))
    case .thirdView(let data):
        return AnyView(ThirdView(path: path, data: data))
    case .fourthView(let data):
        return AnyView(FourthView(path: path, data: data))
    }
}
</code></pre>

<h3 id="views-explanation">Views Explanation</h3>

<ul>
    <li><strong>FirstView</strong>: The initial view where the user can enter text and navigate to <code>SecondView</code> with the entered text data.</li>
</ul>

<pre><code>struct FirstView: View {
    @Binding var path: [NavigationRoutes]
    @State private var demoText: String = ""
    var body: some View {
        VStack {
            TextField("Text", text: $demoText)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .padding()
            Button("Go to second page") {
                path.append(NavigationRoutes.secondView(data: demoText))
            }
        }
        .navigationTitle("First Page")
    }
}
</code></pre>

<ul>
    <li><strong>SecondView</strong>: Displays the text passed from <code>FirstView</code> and provides options to navigate to <code>ThirdView</code> or set <code>ThirdView</code> as the new root.</li>
</ul>

<pre><code>struct SecondView: View {
    @Binding var path: [NavigationRoutes]
    @Binding var appState: AppState
    var data: String
    var body: some View {
        VStack {
            Text(data)
            Button("Go to third page") {
                path.append(.thirdView(data: data))
            }
            Button("Make third page root") {
                path.removeLast(path.count)
                appState = .thirdView
            }
        }
        .navigationTitle("Second Page")
    }
}
</code></pre>

<ul>
    <li><strong>ThirdView</strong>: Displays data and provides a button to navigate to <code>FourthView</code>.</li>
</ul>

<pre><code>struct ThirdView: View {
    @Binding var path: [NavigationRoutes]
    var data: String
    var body: some View {
        VStack {
            Text(data)
            Button("Go to fourth page") {
                path.append(.fourthView(data: data))
            }
        }
        .navigationTitle("Third Page")
    }
}
</code></pre>

<ul>
    <li><strong>FourthView</strong>: Displays data and provides a button to reset the navigation stack to the root.</li>
</ul>

<pre><code>struct FourthView: View {
    @Binding var path: [NavigationRoutes]
    var data: String
    var body: some View {
        VStack {
            Text(data)
            Button(action: {
                path.removeLast(path.count)
            }) {
                Text("Go to root")
            }
        }
        .navigationTitle("Fourth Page")
    }
}
</code></pre>

</body>
</html>
