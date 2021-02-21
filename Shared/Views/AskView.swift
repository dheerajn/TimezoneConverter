//
//  AskView.swift
//  TimezoneConverter
//
//  Created by Raj Raval on 20/02/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import SwiftUI

struct AskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var cityString = ""
    
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
                Spacer()
                    .frame(height: 50)
                Image("world")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 189)
                Spacer()
                    .frame(height: 61)
                TextField("Enter your city here", text: $cityString)
                    .font(.system(.body, design: .rounded))
                    .textFieldStyle(RoundedRectangleTextFieldStyle())
                    .padding([.leading, .trailing], 33)
                Spacer()
                Button(action: {
                    print("Navigated")
                }) {
                    Text("Continue")
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 51)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                }
                .background(Color.yellow)
                .cornerRadius(13)
                .padding(.horizontal, 33)
                Spacer()
                    .frame(height: 35)
            }
            .navigationTitle("Where do you live?")
            .navigationBarItems(
                trailing: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(.callout, design: .rounded))
            )
        }
    }
   
}

//MARK: Custom TextField Style

struct RoundedRectangleTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding([.leading, .trailing], 18)
            .padding([.top, .bottom], 14)
            .background(Color.secondary.opacity(0.3))
            .foregroundColor(.primary)
            .cornerRadius(13)
    }
}

//MARK: NavigationView Title Font

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}


struct AskView_Previews: PreviewProvider {
    static var previews: some View {
        AskView()
    }
}
