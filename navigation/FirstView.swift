//
//  FirstView.swift
//  navigation
//
//  Created by Ranjith Menon on 22/08/24.
//

import SwiftUI

struct FirstView: View {
    @Binding var path:[NavigationRoutes]
    @State private var demoText:String = ""
    var body: some View {
        VStack{
            TextField("Text", text: $demoText)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .padding()
            Button("Go to second page") {
                // NAVIGATES TO SECONDVIEW
                // CURRENT ROOT -> FIRSTVIEW
                path.append(NavigationRoutes.secondView(data: demoText))
            }
        }.navigationTitle("First Page")

    }
}


struct SecondView: View {
    @Binding var path:[NavigationRoutes]
    @Binding var appState: AppState
    var data: String
    var body: some View {
        VStack{
            Text(data)
            Button("Go to third page") {
                // NAVIGATES TO THIRDVIEW
                // CURRENT ROOT -> FIRSTVIEW
                path.append(.thirdView(data: data))
            }
            Button("Make third page root") {
                // NAVIGATES TO THIRDVIEW
                // CURRENT ROOT -> THIRDPAGE
                path.removeLast(path.count)
                appState = .thirdView
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
                // NAVIGATES TO FOURTHVIEW
                // CURRENT ROOT -> DEPENDS ON THE BUTTON CLICKED
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
                // NAVIGATES TO ROOT.
                // CURRENT ROOT -> DEPENDS ON THE BUTTON CLICKED
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
