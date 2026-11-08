//
//  BookRowView.swift
//  Favorites
//
//  Created by matt on 11/7/26.
//

import SwiftUI

struct BookRowView: View {
    
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(book.bookTitle)
                    .font(.body)
                Text(book.bookAuthor)
                    .font(.caption)
                    .foregroundStyle(.primary)
                
                
            }
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) { Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
                
            }
        }
        .padding(.vertical, 8)
        
        
        
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "The Hobbit", bookAuthor: "J.R.R. Tolkien")).environmentObject(FavoritesViewModel())
}
    
  
