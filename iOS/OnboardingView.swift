//
//  OnboardingView.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 20/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            TabView {
                OnboardingItem(
                    image: Constants.Onboarding.ItemOne.image,
                    headline: Constants.Onboarding.ItemOne.headline,
                    subheadline: Constants.Onboarding.ItemOne.subheadline)
                OnboardingItem(
                    image: Constants.Onboarding.ItemTwo.image,
                    headline: Constants.Onboarding.ItemTwo.headline,
                    subheadline: Constants.Onboarding.ItemTwo.subheadline)
                OnboardingItem(
                    image: Constants.Onboarding.ItemThree.image,
                    headline: Constants.Onboarding.ItemThree.headline,
                    subheadline: Constants.Onboarding.ItemThree.subheadline)
                    .padding(.horizontal, 20)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            Button(action: {
                print("Button Tapped")
            }) {
                Text("Continue")
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 51)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.primary)
            }
            .background(Color.yellow)
            .cornerRadius(13)
            .padding(.horizontal, 33)
        }
    }
}
