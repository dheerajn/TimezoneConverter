//
//  SearchBar.swift
//  SearchPlaces
//
//  Created by Peter Wu on 2/17/21.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var isActive: Bool
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        @Binding var isActive: Bool
        
        init(text: Binding<String>, isActive: Binding<Bool>) {
            _text = text
            _isActive = isActive
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
                
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(true, animated: true)
            self.isActive = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
            searchBar.setShowsCancelButton(false, animated: true)
            searchBar.resignFirstResponder()
            self.isActive = false
        }
        
        
        
    }
    
    func makeCoordinator() -> SearchBarView.Coordinator {
        return Coordinator(text: $text, isActive: $isActive)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBarView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 196.0/255.0, alpha: 0.7)
        }
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarView>) {
        uiView.text = text
    }
    
}

