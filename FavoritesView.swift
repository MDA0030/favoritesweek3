//
//  FavoritesView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        Text("Favorites")
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
