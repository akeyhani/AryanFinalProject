//
//  DetailView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI
import MapKit

struct DetailView: View {
    var campground: Campsite
    
   
    
    var mapRegion: MKCoordinateRegion{
        if let lat = Double(campground.latitude), let long = Double(campground.longitude){
            MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), latitudinalMeters: 10_000, longitudinalMeters: 10_00)
        } else {
            MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.24465, longitude: -83.0191), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack{
                ZStack(alignment: .topLeading){
                    Map(initialPosition: .region(mapRegion), interactionModes: [])
                        .mapStyle(.standard)
                        .frame(height: 300)
                        .clipShape(.rect(cornerRadius: 15))
                    VStack(alignment: .leading){
                        Text(campground.name)
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(campground.parkCode.uppercased())
                            .fontWeight(.black)
                            .font(.title2)
                    }
                }
                Divider()
                Text(campground.description)
                    .fontWeight(.light)
                Text("Details")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                Divider()
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(campground.allImages,id:\.url){
                            campimage in
                            
                            AsyncImage(url: URL(string: campimage.url)){
                                result in
                                
                                if let image = result.image{
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height:100)
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                    
                                } else if result.error != nil{
                                    Image(systemName: "photo")
                                } else {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
                Divider()
                
                NavigationLink(destination: WebView(webText: campground.reservationUrl)) {
                    Label("Book Reservation Now", systemImage: "tent")
                }
                
                
            }.padding()
        }
    }
}

#Preview {
    DetailView(campground: Campsite.exampleCampsite)
}
