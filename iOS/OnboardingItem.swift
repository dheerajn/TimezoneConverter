//
//  OnboardingItem.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 20/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct OnboardingItem: View {
    
    let image: String
    let headline: String
    let subheadline: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 274)
            VStack(spacing: 8) {
                Text(headline)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                Text(subheadline)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.bottom, 5)
    }
}
