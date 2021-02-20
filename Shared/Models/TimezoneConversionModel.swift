//
//  TimezoneConversionModel.swift
//  TimezoneConverter
//
//  Created by Peter Wu on 2/19/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

struct TimezoneConversionModel: Codable {
    let baseLocationTimezoneModel: TimezoneModel
    let targetLocationTimezoneModel: TimezoneModel
    
    enum CodingKeys: String, CodingKey {
        case baseLocationTimezoneModel = "base_location"
        case targetLocationTimezoneModel = "target_location"
    }
}
