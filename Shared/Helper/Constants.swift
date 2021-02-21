//
//  Constants.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 20/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Onboarding {
        
        struct ItemOne {
            static let image = "worldInHands"
            static let headline = "Get a world clock"
            static let subheadline = "Get to know about different timezones around the world"
        }
        
        struct ItemTwo {
            static let image = "timePriority"
            static let headline = "Plan your schedule"
            static let subheadline = "Plan your time schedule properly while working remote "
        }
        
        struct ItemThree {
            static let image = "easyCollaboration"
            static let headline = "Work Efficiently"
            static let subheadline = "Be in loop with your remote team working in different timezones"
        }
        
    }
    
}

struct TimeData: Hashable {
    let city: String
    let timezone: String
    let time: String
    let date: String
    let hoursBehind: String
    let gmtOffset: String
    let image: String
    
    static let dataItems = [
        TimeData(city: "Sydney", timezone: "Eastern Daylight Time", time: "12.48am", date: "22nd Feb 2021", hoursBehind: "7 hours 30 mins behind", gmtOffset: "GMT +11.00hrs", image: "moon.fill"),
        TimeData(city: "Mumbai", timezone: "Indian Standard Time", time: "10.30am", date: "20th Feb 2021", hoursBehind: "12 hours 30 mins", gmtOffset: "GMT +5.30hrs", image: "sun.max.fill"),
        TimeData(city: "Mumbai", timezone: "Indian Standard Time", time: "10.30am", date: "20th Feb 2021", hoursBehind: "12 hours 30 mins", gmtOffset: "GMT +5.30hrs", image: "sun.max.fill"),
        TimeData(city: "Sydney", timezone: "Eastern Daylight Time", time: "12.48am", date: "22nd Feb 2021", hoursBehind: "7 hours 30 mins behind", gmtOffset: "GMT +11.00hrs", image: "moon.fill"),
        TimeData(city: "Sydney", timezone: "Eastern Daylight Time", time: "12.48am", date: "22nd Feb 2021", hoursBehind: "7 hours 30 mins behind", gmtOffset: "GMT +11.00hrs", image: "moon.fill"),
        TimeData(city: "Sydney", timezone: "Eastern Daylight Time", time: "12.48am", date: "22nd Feb 2021", hoursBehind: "7 hours 30 mins behind", gmtOffset: "GMT +11.00hrs", image: "moon.fill")
    ]
}

