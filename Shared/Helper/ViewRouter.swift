//
//  ViewRouter.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/20/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation
import SwiftUI

enum ViewToShow {
    case onboarding
    case home
}

class ViewRouter: ObservableObject {
    
    @Published var currentPage: ViewToShow
    
    init() {
        let isOnboardingFlowCompleted = CustomUserDefault.isOnboardingViewShown()
        
        print("isOnboardingFlowCompleted:", isOnboardingFlowCompleted)

        if isOnboardingFlowCompleted == false {
            currentPage = .onboarding
        } else {
            currentPage = .home
        }
    }
}
