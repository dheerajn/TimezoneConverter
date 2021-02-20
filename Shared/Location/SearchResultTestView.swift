//
//  SearchResult.swift
//  SearchPlaces
//
//  Created by Peter Wu on 2/17/21.
//

import SwiftUI
import MapKit

// *** FOR DEMONSTRATION OF LOCATIONSEARCHSERVICE ONLY ***
struct SearchResultTestView: View {
    
    var address: Address
    @State private var locations: [Location] = []
    @EnvironmentObject var locationSearchService: LocationSearchService
    
    var body: some View {
        List {
            ForEach(locations, id: \.self) { location in
                VStack {
                    Text("\(location.city), \(location.nation)")
                }
            }
        }
        .onAppear(perform: {
            locationSearchService.getLocations(address: address) { (locations, error) in
                if let locations = locations {
                    self.locations = locations
                }
            }
        })
    }

}

//struct SearchResult_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
