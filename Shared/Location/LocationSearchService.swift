//
//  LocationSearchService.swift
//  SearchPlaces
//
//  Created by Peter Wu on 2/17/21.
//

import Foundation
import SwiftUI
import MapKit
import Combine

final class LocationSearchService: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    
    @Published var searchQuery = ""
    @Published var addresses: [Address] = []
    private var completions: [MKLocalSearchCompletion] = []
    
    var completer: MKLocalSearchCompleter
    var cancellable: AnyCancellable?
    
    override init() {
        completer = MKLocalSearchCompleter()
        super.init()
        cancellable = $searchQuery.assign(to: \.queryFragment, on: self.completer)
        completer.delegate = self
        completer.resultTypes = .address
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.completions = completer.results
        self.addresses = self.completions.map { Address(street: $0.title , locale: $0.subtitle, completion: $0)}
    }
    
    func getLocations(address: Address, completion: @escaping ([Location]?, LocationError?) -> ()) {
        let request = MKLocalSearch.Request(completion: address.completion)
        let search = MKLocalSearch(request: request)
        var placeMarks: [MKPlacemark] = []
        
        search.start { (response, error) in
            
            if let response = response, error == nil {
                for item in response.mapItems {
                    placeMarks.append(item.placemark)
                }
                // only include locations with country and city
                placeMarks = placeMarks.filter { $0.country != nil || $0.locality != nil }
                let locations = placeMarks.map { Location(city: $0.locality!, nation: $0.country!) }
                completion(locations, nil)
                
            } else {
                completion(nil, LocationError.locationNotFound)
            }
        }
    }
    
    
    
}

extension MKLocalSearchCompletion: Identifiable {}

