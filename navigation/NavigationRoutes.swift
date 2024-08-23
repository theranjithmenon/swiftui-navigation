//
//  NavigationRoutes.swift
//  navigation
//
//  Created by Admin Qaptive on 22/08/24.
//

import Foundation
import SwiftUI


enum NavigationRoutes: Hashable {
    case firstView
    case secondView(data: String)
    case thirdView(data: String)
    case fourthView(data: String)
}

func getDestination(for route: NavigationRoutes, path: Binding<[NavigationRoutes]>) -> AnyView {
    switch route {
    case .firstView:
        return AnyView(FirstView(path: path))
    case .secondView(let data):
        return AnyView(SecondView(path: path, data: data))
    case .thirdView(let data):
        return AnyView(ThirdView(path: path, data: data))
    case .fourthView(let data):
        return AnyView(FourthView(path: path, data: data))
    }
}

