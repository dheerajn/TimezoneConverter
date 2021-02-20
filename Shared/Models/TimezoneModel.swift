//
//  TimezoneModel.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/17/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

struct TimezoneModel: Codable {
    
    let dateTime: String?
    let timezoneName: String?
    let timezoneLocation: String?
    let timezoneAbbreviation: String?
    let gmtOffset: Float?
    let isDst: Bool?
    let requestedLocation: String?
    let latitude: Float?
    let longitude: Float?
    
    enum CodingKeys: String, CodingKey {
        case dateTime = "datetime"
        case timezoneName = "timezone_name"
        case timezoneLocation = "timezone_location"
        case timezoneAbbreviation = "timezone_abbreviation"
        case gmtOffset = "gmt_offset"
        case isDst = "is_dst"
        case requestedLocation = "requested_location"
        case latitude
        case longitude
    }
}
