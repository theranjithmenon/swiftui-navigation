//
//  navigationApp.swift
//  navigation
//
//  Created by Ranjith Menon on 22/08/24.
//

import SwiftUI

@main
struct navigationApp: App {
    @State private var path: [NavigationRoutes] = []
    @State private var appState: AppState = .firstView
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                VStack{
                    switch appState {
                    case .firstView:
                        FirstView(path: $path)
                    case .thirdView:
                        ThirdView(path: $path, data: "Hello")
                    }
                }
                .navigationDestination(for: NavigationRoutes.self) { value in
                    getDestination(for: value, path: $path, appState: $appState)
                }
            }

        }
    }
}

