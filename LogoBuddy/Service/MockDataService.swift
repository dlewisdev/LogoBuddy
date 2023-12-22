//
//  MockDataService.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import Foundation

class MockDataService: LogoServiceProtocol {
    
    var mockData: Data?
    var mockError: ImageAPIError?
    
    func fetchLogo(prompt: String) async throws -> Response {
        if let mockError { throw mockError }
        
        do {
            let image = try JSONDecoder().decode(Response.self, from: mockData ?? mockImageData)
            return image
        } catch {
            throw error as? ImageAPIError ?? .unknownError(error: error)
        }
    }
    

    
    func doSomething() {
        print("Do stuff")
    }
    
}
