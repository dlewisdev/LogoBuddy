//
//  HTTPDataDownloader.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import Foundation

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

extension HTTPDataDownloader {
     func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {
        
        guard let url = URL(string: endpoint) else {
            throw ImageAPIError.requestFailed(description: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ImageAPIError.requestFailed(description: "Request Failed")
        }
        
        guard httpResponse.statusCode == 200  else {
            throw ImageAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            throw error as? ImageAPIError ?? .unknownError(error: error)
        }
    }
}
