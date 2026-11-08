//
//  HobbiesView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import SwiftUI

struct HobbiesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.filteredHobbies(searchText: searchText)) { hobby in HobbyRowView(hobby: hobby)
                }
                
            }
            .padding()
        }
        
        
        
    }
}

//#Preview {
  //  HobbiesView()
   //     .environmentObject(FavoritesViewModel())
    
//}
