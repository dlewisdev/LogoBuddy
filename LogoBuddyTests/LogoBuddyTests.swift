//
//  LogoBuddyTests.swift
//  LogoBuddyTests
//
//  Created by Danielle Lewis on 12/21/23.
//

import XCTest
@testable import LogoBuddy

final class LogoBuddyTests: XCTestCase {
    func test_DecodeImage() throws {
        do {
            let image = try JSONDecoder().decode(Response.self, from: mockImageData)
            XCTAssertTrue(!image.imageUrl.isEmpty) // ensures that image is being loaded
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

}
