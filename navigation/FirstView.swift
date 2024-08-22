//
//  ContentView.swift
//  navigation
//
//  Created by Admin Qaptive on 22/08/24.
//

import SwiftUI

struct FirstView: View {
    @Binding var path:[NavigationRoutes]
    @State private var demoText:String = ""
    var body: some View {
        VStack{
            TextField("Text", text: $demoText)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Go to second page") {
                path.append(NavigationRoutes.secondView(data: demoText))
            }
        }.navigationTitle("First Page")

    }
}


struct SecondView: View {
    @Binding var path:[NavigationRoutes]
    var data: String
    var body: some View {
        VStack{
            Text(data)
            Button("Go to third page") {
                path.append(.thirdView(data: data))
            }
        }.navigationTitle("Second Page")
    }
}

struct ThirdView: View {
    @Binding var path:[NavigationRoutes]
    var data: String
    var body: some View {
        VStack{
            Text(data)
            Button("Go to fourth page") {
                path.append(.fourthView(data: data))
            }
        }.navigationTitle("Third Page")
    }
}

struct FourthView: View {
    @Binding var path:[NavigationRoutes]
    var data: String
    var body: some View {
        VStack{
            Text(data)
            Button(action: {
                path.removeLast(path.count)
            }, label: {
                Text("Go to root")
            }
            )
        }.navigationTitle("Fourth Page")
    }
}

struct FirstView_Previews: PreviewProvider {
    @State static var path: [NavigationRoutes] = []

    static var previews: some View {
        NavigationStack(path: $path) {
            FirstView(path: $path)
        }
    }
}
