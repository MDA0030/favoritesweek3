//
//  SettingsView.swift
//  Favorites
//
//  Created by matt on 11/5/26 using template code from Module 3 Lecture//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel
    @State private var showResetAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                }
                Section {
                    Button(role: .destructive) {
                        showResetAlert = true
                    } label: {
                        Label("Clear Favorites", systemImage: "trash")
                    }
                }
                .alert("Are you sure you want to clear all favorites?", isPresented: $showResetAlert) {
                    Button("Clear", role: .destructive) {
                        favoritesViewModel.clearAllFavorites()
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("All favorites will delete")
                }
            }
            .navigationTitle("Settings")
        }
        
        
    }
}

#Preview {
    SettingsView()
        .environmentObject(FavoritesViewModel())
    
    
}
