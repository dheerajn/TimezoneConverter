//
//  TimezoneConverterApp.swift
//  Shared
//
//  Created by Dheeru Neelam on 2/17/21.
//

import SwiftUI

@main
struct TimezoneConverterApp: App {
    var body: some Scene {
        WindowGroup {
            BaseView().environmentObject(ViewRouter())
        }
    }
}
