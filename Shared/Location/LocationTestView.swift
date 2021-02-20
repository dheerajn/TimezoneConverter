//
//  LocationTestView.swift
//  TimezoneConverter (iOS)
//
//  Created by Peter Wu on 2/20/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

// *** FOR DEMONSTRATION OF LOCATIONSEARCHSERVICE ONLY ***
struct LocationTestView: View {
    @ObservedObject var locationSearchService = LocationSearchService()
    
    var body: some View {
        VStack {
            SearchBarView(text: $locationSearchService.searchQuery)
            List(locationSearchService.addresses) { address in
                NavigationLink(
                    destination: SearchResultTestView(address: address).environmentObject(locationSearchService),
                    label: {
                        
                        VStack(alignment: .leading) {
                            Text(address.street)
                            Text(address.locale)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    })
                    
            }
            .navigationTitle(Text("Search near me"))
        }
    }
}

struct LocationTestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationTestView()
    }
}
