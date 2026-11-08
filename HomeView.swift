//
//  HomeView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import SwiftUI

enum ContentCategory : String, CaseIterable {
    
    case cities = "Cities"
    case hobbies = "Hobbies"
    case books = "Books"
    
    
}


struct HomeView: View {
    
    @State private var selectedCategory: ContentCategory = .cities
    @State private var searchText: String = ""
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(ContentCategory.allCases, id: \.self) {
                        category in Text(category.rawValue).tag(category)
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                selectedContentView()
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search \(selectedCategory.rawValue)")
            
            
            
        }
    }
        //wraps views into tuple view -> text, text
    @ViewBuilder
    private func selectedContentView() -> some View {
        if selectedCategory == .cities {
            CitiesView(searchText: $searchText)
        } else if selectedCategory == .hobbies {
            HobbiesView(searchText: $searchText)
        } else if selectedCategory == .books {
            BookView(searchText: $searchText)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(FavoritesViewModel())
}
