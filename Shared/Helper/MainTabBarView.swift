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
    @EnvironmentObject var viewRouter: ViewRouter

    init() {
        UITabBar.appearance().barTintColor = UIColor.black.withAlphaComponent(0.6)
        UITabBar.appearance().alpha = 1.0
        UITabBar.appearance().clipsToBounds = true
    }
    
    var body: some View {
        TabView(selection: $selectTabBar) {
            
            HomeView()
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

        }
        .accentColor(Color.white)
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
