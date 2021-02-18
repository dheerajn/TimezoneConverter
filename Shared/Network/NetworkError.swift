//
//  NetworkError.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/17/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

/// Defines the Network service errors.
enum NetworkError: Error {
    case invalidRequest
    case invalidToken
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}

struct StandardError: Error, Codable {
    var status: Int?
    var message: String?
    var uiErrorKey: String?
    let isTokenValid: Bool
    
    static let defaultValueWithValidToken = StandardError(status: -1, message: "No message", uiErrorKey: "No UI Error", isTokenValid: true)
    static let defaultValueWithInValidToken = StandardError(status: -1, message: "No message", uiErrorKey: "No UI Error", isTokenValid: false)
}
