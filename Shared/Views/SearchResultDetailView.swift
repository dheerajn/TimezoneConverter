//
//  SearchResultDetailView.swift
//  TimezoneConverter (iOS)
//
//  Created by Peter Wu on 2/21/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct SearchResultDetailView: View {
    
    @EnvironmentObject var locationSearchService: LocationSearchService
    @EnvironmentObject var user: User
    @Binding var presentsDetail: Bool // if this view and parent view's both set to false, will pop back to root of navigation view
    @State private var locations: [Location] = []
    @State private var hasError: Bool = false
    
    var address: Address
    
    var body: some View {
        VStack {
            if !hasError {
                List {
                    ForEach(locations, id: \.self) { location in
                        VStack {
                            Button(action: {
                                // after user choose location, dismiss views and go all the way back to AskView
                                user.chooseLocation(location)
                                presentsDetail = false
                            }, label: {
                                Text(location.description())
                            })
                        }
                    }
                }
                .onAppear(perform: {
                    locationSearchService.getLocations(address: address) { (locations, error) in
                        if let locations = locations {
                            self.locations = locations
                        } else {
                            hasError = true
                        }
                    }
                })
            } else {
                Text("Sorry we cannot find any city near you")
            }
        }
    }
}

//struct SearchResultDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultDetailView()
//    }
//}
