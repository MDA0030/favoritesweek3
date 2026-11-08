//
//  FavoritesView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import SwiftUI

//FavoritesView
struct FavoritesView: View {
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                if favorites.books.contains(where: { $0.isFavorite}) {
                    Section("Books") {
                        ForEach(favorites.books.filter { $0.isFavorite}) {
                            book in BookRowView(book: book)
                        }
                    }
                    
                }
                if favorites.hobbies.contains(where: { $0.isFavorite}) {
                    Section("Hobbies") {
                        ForEach(favorites.hobbies.filter { $0.isFavorite}) {
                             HobbyRowView(hobby: $0)
                        }
                    }
                    
                }
                if favorites.cities.contains(where: { $0.isFavorite}) {
                    Section("Cities") {
                        ForEach(favorites.cities.filter { $0.isFavorite}) {
                            city in CityCardView(city: city)
                            //image adjustments for this view - img was overfilling
                                .frame(maxWidth: .infinity)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                                .clipped()
                                
                        }
                    }
                    
                }
            }
            .overlay {
                if !favorites.books.contains(where: { $0.isFavorite}) &&
                    !favorites.hobbies.contains(where: { $0.isFavorite}) &&
                    !favorites.cities.contains(where: { $0.isFavorite}) {
                    ContentUnavailableView("No favorites", systemImage: "heart")
                }
                
            }
            .listStyle(.plain)
            //design change for pale blue background color
            .scrollContentBackground(.hidden)
            .background(Rectangle()
                .fill(Color.blue.opacity(0.1))
                )
            .navigationTitle("Favorites")
        }

        
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
