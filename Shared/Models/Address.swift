//
//  Address.swift
//  TimezoneConverter (iOS)
//
//  Created by Peter Wu on 2/20/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation
import MapKit

struct Address {
    let street: String
    let locale: String
    
    let completion: MKLocalSearchCompletion
}
