//
//  TimezoneModel.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/17/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

struct TimezoneModel: Codable {
    let datetime: String
    let timezone_name: String
    let timezone_location: String?
    let timezone_abbreviation: String
    let gmt_offset: Int
    let is_dst: Bool
    let requested_location: String
    let latitude: Float
    let longitude: Float
    
}
