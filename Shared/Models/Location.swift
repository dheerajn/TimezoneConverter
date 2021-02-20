//
//  Location.swift
//  TimezoneConverter
//
//  Created by Peter Wu on 2/19/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

struct Location: Hashable {
    let city: String
    let nation: String
    
    func description() -> String {
        return "\(city), \(nation)"
    }
}
