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
            //design change to add small green color at bottom of city image
            .scrollContentBackground(.hidden)
            .background(Rectangle()
                .fill(Color.green.opacity(0.1))
                )
            .padding()
        }
        
    }
}

#Preview {
    CitiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
