//
//  ImageViewModel.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import Foundation
import SwiftUI

@Observable
class ImageViewModel {
    var createdImages = [CreatedImage]()
    var service = LogoDataService()
    
    func getImage(prompt: String) {
        Task {
            do {
                let response = try await service.fetchLogo(prompt: prompt)
                createdImages = response.data
            } catch {
                throw ImageAPIError.requestFailed(description: "Fetch failed")
            }
        }
        
        
    }
}
