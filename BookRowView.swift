//
//  BookRowView.swift
//  Favorites
//
//  Created by matt on 11/7/26.
//

import SwiftUI

//BookRowView
struct BookRowView: View {
    
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    @State private var isSelected: Bool = false
    
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(book.bookTitle)
                    .font(.body)
                Text(book.bookAuthor)
                    .font(.caption)
                    .foregroundStyle(.primary)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Color.blue.opacity(0.25) : Color.clear))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.1)) {
                    isSelected.toggle()
                }
                
            }
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) { Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
                
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 2)
        .background(RoundedRectangle(cornerRadius: 1)
            .fill(Color.pink.opacity(0.1))
            )
         
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "The Hobbit", bookAuthor: "J.R.R. Tolkien")).environmentObject(FavoritesViewModel())
}
    
  
