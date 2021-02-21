//
//  ListDetailView.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 21/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct ListDetailView: View {
    
    let city: String
    let timezone: String
    let time: String
    let date: String
    let hoursBehind: String
    let gmtOffset: String
    let image: String
   
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(date)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(image == "sun.max.fill" ? Color.black : .white)
                        .multilineTextAlignment(.leading)
                    Text(hoursBehind)
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(image == "sun.max.fill" ? Color.black : .white)
                        .opacity(0.7)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                ZStack(alignment: .center) {
                    Color.white
                        .frame(width: 40, height: 40)
                        .cornerRadius(7)
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(image == "sun.max.fill" ? .orange : .purple)
                }
            }
            .padding([.top], 18)
            .padding(.horizontal, 18)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(time)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(image == "sun.max.fill" ? Color.black : .white)
                        .multilineTextAlignment(.leading)
                    Text(timezone)
                        .font(.system(.footnote, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(image == "sun.max.fill" ? Color.black : .white)
                        .opacity(0.7)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(city)
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(image == "sun.max.fill" ? Color.black : .white)
                        .multilineTextAlignment(.leading)
                    Text(gmtOffset)
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(image == "sun.max.fill" ? Color.black : .white)
                        .opacity(0.7)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding([.bottom], 18)
            .padding([.top], 16)
            .padding(.horizontal, 18)
        }
        .background(image == "sun.max.fill" ? Color.yellow : .purple)
        .cornerRadius(13)
        .padding([.horizontal], 33)
        .padding(.top, 15)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(city: "Mumbai", timezone: "Indian Standard Time", time: "10.30am", date: "20th Feb 2021", hoursBehind: "12 hours 30 mins", gmtOffset: "GMT +5.30hrs", image: "sun")
    }
}


