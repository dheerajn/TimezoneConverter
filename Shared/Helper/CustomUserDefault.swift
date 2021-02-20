//
//  CustomUserDefault.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/20/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation
import UIKit

class CustomUserDefault {
    //MARK: Set values
    class func setOnboardingViewShown(value: Bool) {
        UserDefaults.standard.set(value, forKey: "Constants.onboarding")
    }
    
    //MARK: Get values
    class func isOnboardingViewShown() -> Bool {
        return UserDefaults.standard.bool(forKey: "Constants.onboarding")
    }
}
