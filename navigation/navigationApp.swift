//
//  navigationApp.swift
//  navigation
//
//  Created by Admin Qaptive on 22/08/24.
//

import SwiftUI

@main
struct navigationApp: App {
    @State private var path: [NavigationRoutes] = []
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                FirstView(path: $path)
                .navigationDestination(for: NavigationRoutes.self) { value in
                    getDestination(for: value, path: $path)
                }
            }

        }
    }
}

