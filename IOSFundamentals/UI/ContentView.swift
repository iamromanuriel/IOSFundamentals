//
//  ContentView.swift
//  IOSFundamentals
//
//  Created by Roman Uriel on 10/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    NavigationLink(destination:IMCView()){
                        Text("Start")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
