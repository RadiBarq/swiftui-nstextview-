//
//  ContentView.swift
//  Shared
//
//  Created by Radi Barq on 29/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "Enter text here"
    @State private var foregroundColor: NSColor = .red
    var body: some View {
        VStack {
            Button("Change text color") {
                foregroundColor = foregroundColor == .red ? .blue : .red
            }
            CustomTextView(foregroundColor: $foregroundColor, text: $text, font: NSFont.systemFont(ofSize: 20))
            .frame(width: 500, height: 500)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
