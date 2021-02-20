//
//  HomeTabBarViewModel.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/20/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation
import Combine

class HomeTabBarViewModel: ObservableObject, NetworkCalls {
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        getSearchedLocationTimezone()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.getTimezones()
        }
    }
    
    private func getSearchedLocationTimezone() {
        let losAngeles = Location(city: "Los Angeles", nation: "United States")
        let mumbai = Location(city: "Mumbai", nation: "India")
        let dateTime = Date()
        
        convertTimezones(baseLocation: losAngeles, baseDatetime: dateTime, targetLocation: mumbai)
            .sink { (completion) in
                print(completion)
            } receiveValue: { (result) in
                print(result)
            }
            .store(in: &cancellable)
    }
    
    private func getTimezones() {
        let losAngeles = Location(city: "Los Angeles", nation: "United States")
        
        getTimezones(location: losAngeles)
            .sink { (completion) in
                print("completion: \(completion)")
            } receiveValue: { (result) in
                print(result)
            }
            .store(in: &cancellable)
    }
}
