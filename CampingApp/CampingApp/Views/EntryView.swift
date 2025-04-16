//
//  EntryView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI

struct EntryView: View {
    var body: some View {
        TabView{
            Tab("App Details", systemImage: "tent"){
                MainView()
            }
            Tab("Camp Search", systemImage: "magnifyingglass"){
                ContentView()
            }
        }
    }
}

#Preview {
    EntryView()
}
