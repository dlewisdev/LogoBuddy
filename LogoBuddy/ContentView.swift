//
//  ContentView.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.artist)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
