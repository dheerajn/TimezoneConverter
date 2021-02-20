//
//  MainTabBarView.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/18/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct MainTabBarView: View {
    @State var selectTabBar = 0
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black.withAlphaComponent(0.6)
        UITabBar.appearance().alpha = 1.0
        UITabBar.appearance().clipsToBounds = true
        
        // Uncomment to testing network service and TimeZone model only
        
        // Test for getTimeZones()
//        let networkService = NetworkService(urlString: "test")
//        let losAngeles = Location(city: "Los Angeles", nation: "United States")
//        let publisher = networkService.getTimezones(location: losAngeles)
//        let result = publisher.sink { (completion) in
//            print("completion: \(completion)")
//        } receiveValue: { (result) in
//            switch result {
//            case .success(let model):
//                print("model: \(model)")
//            case .failure(let error):
//                print("error: \(error.localizedDescription)")
//                print(error.message)
//                print(error.status)
//                print(error.uiErrorKey)
//                print(error.isTokenValid)
//            }
//        }
        
        // Test for convertTimezones()
//        let networkService = NetworkService(urlString: "test")
//        let losAngeles = Location(city: "Los Angeles", nation: "United States")
//        let mumbai = Location(city: "Mumbai", nation: "India")
//        let dateTime = Date()
//        let publisher = networkService.convertTimezones(baseLocation: losAngeles, baseDatetime: dateTime, targetLocation: mumbai)
//        let result = publisher.sink { (completion) in
//            print("completion: \(completion)")
//        } receiveValue: { (result) in
//            switch result {
//            case .success(let model):
//                print("model: \(model)")
//            case .failure(let error):
//                print("error: \(error.localizedDescription)")
//                print(error.message)
//                print(error.status)
//                print(error.uiErrorKey)
//                print(error.isTokenValid)
//            }
//        }

        


        
    }
    
    var body: some View {
        TabView(selection: $selectTabBar) {
            HomeTabBarView()
                .tabItem {
                    Image(systemName: MainTabBarViewItems.home.imageName)
                    Text(MainTabBarViewItems.home.title)
                }
                .tag(MainTabBarViewItems.home.rawValue)
            
            ContentView()
                .tabItem {
                    Image(systemName: MainTabBarViewItems.friends.imageName)
                    Text(MainTabBarViewItems.friends.title)
                }
                .tag(MainTabBarViewItems.friends.rawValue)
            
            ContentView()
                .tabItem {
                    Image(systemName: MainTabBarViewItems.notifications.imageName)
                    Text(MainTabBarViewItems.notifications.title)
                }
                .tag(MainTabBarViewItems.notifications.rawValue)
            
            ContentView()
                .tabItem {
                    Image(systemName: MainTabBarViewItems.profile.imageName)
                    Text(MainTabBarViewItems.profile.title)
                }
                .tag(MainTabBarViewItems.profile.rawValue)
        }
        .accentColor(Color.white)
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
