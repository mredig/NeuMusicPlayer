//
//  SearchView.swift
//  Neu Music Player
//
//  Created by Spencer Curtis on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

protocol SearchResult: Identifiable {
    var mainText: String { get }
    var subText: String? { get }
}

struct Artist: Identifiable {
    var name: String
    var id = UUID()
    
    var mainText: String {
        return name
    }

    var subText: String? = nil
}

struct SearchView: View {
    
    var searchResults: [Artist] = [
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles")
    ]
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
            Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            List(searchResults) { (searchResult) in
                
                Text(searchResult.mainText)
                
            }
            
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
