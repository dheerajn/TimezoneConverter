//
//  HomeTabBarView.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/18/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct HomeTabBarView: View {
    @State var searchText: String = ""
    @ObservedObject var viewModel = HomeTabBarViewModel()
    @ObservedObject var locationSearchService = LocationSearchService()
    
    var body: some View {
        NavigationView {
            VStack {
                
                SearchBarView(text: $locationSearchService.searchQuery)
                    
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
