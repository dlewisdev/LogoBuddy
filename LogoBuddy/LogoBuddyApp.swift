//
//  LogoBuddyApp.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import SwiftUI

@main
struct LogoBuddyApp: App {
    @State var vm = ImageViewModel()
    
    var body: some Scene {
        WindowGroup {
            ImagesView()
                .environment(vm)
                .onAppear {
                    print(Bundle.main.infoDictionary?["API_KEY"] as? String)
                }
        }
    }
}
