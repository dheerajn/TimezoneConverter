//
//  SearchResultView.swift
//  TimezoneConverter (iOS)
//
//  Created by Peter Wu on 2/21/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct SearchResultView: View {
    @ObservedObject var locationSearchService = LocationSearchService()
    @State private var searchBarIsActive = false
    @EnvironmentObject var user: User
    @Binding var presentsDetail: Bool // set to false to pop back to root of navigation view
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $locationSearchService.searchQuery, isActive: $searchBarIsActive)
                    .accentColor(.blue)
                
                List(locationSearchService.addresses) { address in
                    VStack(alignment: .leading) {
                        NavigationLink(
                            destination:
                                SearchResultDetailView(presentsDetail: $presentsDetail, address: address).environmentObject(locationSearchService),
                            label: {
                                Text(address.street)
                                Text(address.locale)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            })
                            .isDetailLink(presentsDetail)
                        
                    }
                }
                .navigationTitle(Text("Search near me"))
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(presentsDetail: Binding.constant(true))
    }
}
