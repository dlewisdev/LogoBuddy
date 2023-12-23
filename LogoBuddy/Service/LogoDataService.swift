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
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func fetchLogo(prompt: String) async throws -> Response {
        
        // Check if API Key exists
        guard apiKey != nil else {
            return Response(created: 0, data: [CreatedImage]())
        }
        
        // Define endpoint
        if let url = URL(string: "https://api.openai.com/v1/images/generations") {
            print(url)
            
            // 2. Create request
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("\(apiKey!)", forHTTPHeaderField: "Authorization")
            
            let parameters: [String:Any] = [
                "model":"dall-e-3",
                "prompt":prompt,
                "size":"1024x1024"
            ]
            let requestBody = try? JSONSerialization.data(withJSONObject: parameters)
            
            request.httpBody = requestBody
            
            // 3. Send request
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                let promptResult = try decoder.decode(Response.self, from: data)
                return promptResult
                
            } catch {
                print(error)
            }
        }
        
        return Response(created: 0, data: [CreatedImage]())
    }
}
