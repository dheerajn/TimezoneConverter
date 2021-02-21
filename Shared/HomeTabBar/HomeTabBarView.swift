//
//  HomeTabBarView.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/18/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct HomeTabBarView: View {
    @ObservedObject var viewModel = HomeTabBarViewModel()
    @ObservedObject var locationSearchService = LocationSearchService()
    @State private var searchBarIsActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                SearchBarView(text: $locationSearchService.searchQuery, isActive: $searchBarIsActive)
                    .accentColor(.blue)
                
                
                if searchBarIsActive {
                    List(locationSearchService.addresses) { address in
                        VStack(alignment: .leading) {
                            Text(address.street)
                            Text(address.locale)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                if !searchBarIsActive {
                    CurrentLocationView()
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding()
                }
                
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
