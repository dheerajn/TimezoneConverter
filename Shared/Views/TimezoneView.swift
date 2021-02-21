//
//  TimezoneView.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 21/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct TimezoneView: View {
    
    let city: String
    let timezone: String
    let time: String
    let date: String
    let day: String
    let gmtOffset: String
    let image: String
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(date)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Text(day)
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(Color(UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 1.00)))
                        .opacity(0.6)
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
                        .foregroundColor(.orange)
                }
            }
            .padding([.top], 18)
            .padding(.horizontal, 18)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(time)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Text(timezone)
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(Color(UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 1.00)))
                        .opacity(0.6)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(city)
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Text(gmtOffset)
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(Color(UIColor(red: 0.24, green: 0.24, blue: 0.26, alpha: 1.00)))
                        .opacity(0.6)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding([.bottom], 18)
            .padding([.top], 16)
            .padding(.horizontal, 18)
        }
        .background(Color.yellow)
        .cornerRadius(13)
        .padding([.horizontal], 33)
        .padding(.top, 22)
    }
}

struct TimezoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimezoneView(city: "Mumbai", timezone: "Indian Standard Time", time: "10.30am", date: "20th Feb 2021", day: "Saturday", gmtOffset: "GMT +5.30hrs", image: "sun")
    }
}

