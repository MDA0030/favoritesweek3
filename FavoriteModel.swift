//
//  FavoriteModel.swift
//  Favorites
//
//  Created by matt on 11/6/26 using template code from Module 3 Lecture//

import Foundation

protocol Favoritable : Identifiable {
    var id : Int { get}
    var isFavorite: Bool {get set }
    var searchableText: String { get }
}

struct CityModel : Favoritable {
    // each must have unique prop.
    let id: Int
    let cityName: String
    let cityImage: String
    var isFavorite: Bool = false
    var searchableText: String {
        return cityName
    }
}


struct HobbyModel : Favoritable {
    // each must have unique prop.
    // hobbyname, icon, fav flag
    let id: Int
    let hobbyName: String
    let hobbyIcon: String
    var isFavorite: Bool = false
    var searchableText: String {
        return hobbyName
    }
}


struct BookModel : Favoritable {
    // each must have unique prop.
    let id: Int
    let bookTitle: String
    let bookAuthor: String
    var isFavorite: Bool = false
    var searchableText: String {
        return bookTitle + " " + bookAuthor
    }
}
