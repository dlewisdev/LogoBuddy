//
//  Response.swift
//  LogoBuddy
//
//  Created by Danielle Lewis on 12/21/23.
//

import Foundation

struct Response: Codable {
    let created: Int
    let data: [CreatedImage]
}
