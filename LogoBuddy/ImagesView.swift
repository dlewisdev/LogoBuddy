//
//  ContentView.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

struct ImagesView: View {
    @State var prompt: String = ""
    @Environment(ImageViewModel.self) var vm
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Prompt", text: $prompt)
                    .textFieldStyle(.roundedBorder)
                
                Button("Go") {
                    vm.getImage(prompt: prompt)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
            
        }
    }
}

#Preview {
    ImagesView()
}
