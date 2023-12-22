//
//  DataService.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import Foundation

protocol LogoServiceProtocol {
    func fetchLogo(prompt: String) async throws -> Response
}

struct LogoDataService: LogoServiceProtocol, HTTPDataDownloader {
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    private let prompt: String
    
    private var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openai.com"
        components.path = "v1/images/"
        
        return components
    }
    
    private func imageGenerationURL(prompt: String) -> String? {
        var components = baseURLComponents
        components.path += "generations"
        components.queryItems = [
            .init(name: "prompt", value: prompt),
            .init(name: "model", value: "dall-e-3"),
            .init(name: "n", value: "1"),
            .init(name: "response_format", value: "url"),
            .init(name: "size", value: "1024x1024")
            
        ]
        
        return components.url?.absoluteString
    }
    
    func fetchLogo(prompt: String) async throws -> Response {
        guard let endpoint = imageGenerationURL(prompt: prompt) else {
            throw ImageAPIError.requestFailed(description: "Invalid endpoint")
        }
        
        let image = try await fetchData(as: Response.self, endpoint: endpoint)
        
        return image
    }
}
