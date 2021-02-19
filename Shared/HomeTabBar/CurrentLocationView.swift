//
//  CurrentLocationView.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/18/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct CurrentLocationView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
            VStack {
                HStack {
                    Text("Current timezone")
                    
                    Spacer()
                    
                    HStack {
                        Text("3rd Mar 32")
                        
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.gray.opacity(0.8))
                    }
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("10:30 am")
                            .font(.title)
                            .bold()
                        
                        Text("Indian Standard Time")
                            .font(.system(size: 17, weight: Font.Weight.thin))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Mumbai City")
                            .font(.body)
                            .bold()
                        
                        Text("GMT +5.30 hrs")
                            .font(.system(size: 17, weight: Font.Weight.thin))
                    }
                }
                .padding()
            }
        }
    }
}

struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
            .frame(height: 200)
            .cornerRadius(20.0)
            .padding()
    }
}
