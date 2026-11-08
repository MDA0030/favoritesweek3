//
//  BookView.swift
//  Favorites
//
//  Created by matt on 11/7/26.
//

import SwiftUI

struct BookView: View {
    
    @Binding var searchText: String
    @EnvironmentObject var favorites: FavoritesViewModel
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                /* similar ForEach to ForEach used in HobbiesView    */
                
                ForEach(favorites.filteredBooks(searchText: searchText)) { book in BookRowView(book: book)
                }
                
            }
            .padding(4)
        }


        
    }
}

#Preview {
    BookView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
