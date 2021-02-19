//
//  MainTabBarItems.swift
//  TimezoneConverter
//
//  Created by Dheeraj Neelam on 2/18/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

enum MainTabBarViewItems: Int, CaseIterable {
    case home
    case friends
    case notifications
    case profile
    
    var title: String {
        switch self {
        case .friends:
            return "Info"
            
        case .home:
            return "Home"
            
        case .notifications:
            return "Map"
            
        case .profile:
            return "More"
        }
    }
    
    var imageName: String {
        switch self {
        case .friends:
            return "info"
            
        case .home:
            return "square.split.2x2"
            
        case .notifications:
            return "map"
            
        case .profile:
            return "ellipsis"
        }
    }
}
