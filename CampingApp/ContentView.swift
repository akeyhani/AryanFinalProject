//
//  ContentView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI

struct ContentView: View {
    @State private var sheetIsShowing = false
    
    //MARK: - Properties
    let campsites: [Campsite] = Bundle.main.decode("allParks.json")

    var body: some View {
        NavigationStack {
            List{
                ForEach(campsites){
                    campsite in
                    
                    NavigationLink(destination: DetailView(campground: campsite)){
                        RowView(campsite: campsite)
                    }
                }
            }
            .navigationTitle("NPS Campground")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Info", systemImage: "info.circle"){
                        sheetIsShowing.toggle()
                    }
                }
            }
            .sheet(isPresented: $sheetIsShowing) {
                VStack{
                    Text("NPS Data for Your Apps, Maps, and Websites")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity , alignment: .leading)
                    Divider()
                    Text("The National Park Service API (application programming interface) and developer resources are designed to provide authoritative NPS data and content for internal and external developers creating apps, maps, and websites. You'll find photos and essential information about NPS sites including visitor centers, campgrounds, events, news, alerts, and more, as well as detailed articles about NPS natural and cultural features and important people and places.")
                        .italic()
                }.padding()
            }
        }
            
        
    }
}

#Preview {
    ContentView()
}


