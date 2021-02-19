//
//  HomeTabBarView.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/18/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct HomeTabBarView: View {
    var body: some View {
        NavigationView {
            VStack {
                CurrentLocationView()
                    .frame(height: 200)
                    .cornerRadius(20)
                    .padding()
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBarView()
    }
}
