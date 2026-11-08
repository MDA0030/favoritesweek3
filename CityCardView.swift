//
//  CityCardView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import SwiftUI

struct CityCardView: View {
    
    let city : CityModel
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
           
            Image(city.cityImage)
                .resizable()
                .scaledToFill()
               .frame(maxWidth: .infinity)
               .frame(height: 140)
               .clipped()
            //debugging image too big in FavoritesView
             //   .overlay {
             //       Image (city.cityName)
              //          .resizable()
              //          .scaledToFit()
             //   }
             //   .clipped()
            
            HStack {
                Text(city.cityName)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Color.black.opacity(0.35))
                
                Spacer()
                
                Button(action: {
                    favorites.toggleFavoriteCity(city: city)
                    
                }) {
                    Image(systemName: city.isFavorite ? "heart.fill" : "heart")
                        .padding(6)
                        .foregroundStyle(city.isFavorite ? .red : .white)
                        .background(Color.black.opacity(0.35))
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 10)
            //design change to make bottom of city image blue
            .scrollContentBackground(.hidden)
            .background(Rectangle()
                .fill(Color.blue.opacity(0.1))
                )        }
        .shadow(radius: 3)
        
    }
}

#Preview {
    CityCardView(city: CityModel(id: 1, cityName: "Amsterdam", cityImage: "amsterdam", isFavorite: false))
}
