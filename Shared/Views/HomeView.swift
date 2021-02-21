//
//  HomeView.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 21/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State private var cityString = ""
    
    let items = TimeData.dataItems
    let colors: [Color] = [.red, .green, .purple, .pink, .orange, .blue, .gray]
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.rounded(ofSize: 34, weight: .bold)
        ]
        appearance.largeTitleTextAttributes = attributes
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        TextField("Search for any city", text: $cityString)
                            .font(.system(.body, design: .rounded))
                            .textFieldStyle(RoundedRectangleTextFieldStyle())
                            .padding(.top, 22)
                            .padding([.leading, .trailing], 33)
                        TimezoneView(
                            city: "Mumbai",
                            timezone: "Indian Standard Time",
                            time: "10.30am", date: "20th Feb 2021",
                            day: "Saturday", gmtOffset: "GMT +5.30hrs",
                            image: "sun.max.fill")
                        Text("World Clock")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 33)
                            .padding(.top, 18)
                        ForEach(items, id: \.self) { item in
                            ListDetailView(
                                city: item.city,
                                timezone: item.timezone,
                                time: item.time,
                                date: item.date,
                                hoursBehind: item.hoursBehind,
                                gmtOffset: item.gmtOffset,
                                image: item.image
                            )
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
