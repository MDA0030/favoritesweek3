//
//  CitiesView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import SwiftUI

struct CitiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    
    
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                ForEach(favorites.filteredCities(searchText: searchText)) {
                    city in CityCardView(city: city)
                    
                }
                
            }
            .padding()
        }
        
    }
}

#Preview {
    CitiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
