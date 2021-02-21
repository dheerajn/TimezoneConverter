//
//  TimezoneConverterApp.swift
//  Shared
//
//  Created by Dheeru Neelam on 2/17/21.
//

import SwiftUI

@main
struct TimezoneConverterApp: App {
    @StateObject var user = User()
    
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(ViewRouter())
                .environmentObject(user)
        }
    }
}
