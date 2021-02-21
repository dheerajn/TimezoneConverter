//
//  BaseView.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/20/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct BaseView : View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == .onboarding {
                //TODO: change this once Raj's changes are merged
                ContentView().environmentObject(viewRouter)
                    .transition(.scale)
                
            } else if viewRouter.currentPage == .home {
                MainTabBarView().environmentObject(viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView().environmentObject(ViewRouter())
    }
}
