//
//  User.swift
//  TimezoneConverter (iOS)
//
//  Created by Peter Wu on 2/21/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

class User: ObservableObject {
    @Published private(set) var chosenLocation: Location?
    
    
    init(location: Location? = nil) {
        self.chosenLocation = location
    }
    
    func chooseLocation(_ location: Location) {
        self.chosenLocation = location
    }
    
}
