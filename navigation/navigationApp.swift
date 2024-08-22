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
                    switch value {
                    case .firstView:
                        FirstView(path: $path)
                    case .secondView(let data):
                        SecondView(path: $path,data: data)
                    case .thirdView(let data):
                        ThirdView(path: $path,data: data)
                    case .fourthView(let data):
                        FourthView(path: $path,data: data)
                    
                    }
                }
            }

        }
    }
}

