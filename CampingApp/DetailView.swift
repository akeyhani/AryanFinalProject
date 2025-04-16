//
//  DetailView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI

struct DetailView: View {
    var campground: Campsite
    var body: some View {
        VStack{
            Text(campground.name)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(campground.parkCode.uppercased())
                .fontWeight(.black)
                .font(.title2)
            Divider()
            Text(campground.description)
                .fontWeight(.light)
            Text("Details")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            Divider()
            
            HStack{
                Text("Sites reservable:")
                Spacer()
                Text("^[\(Int(campground.numberOfSitesReservable) ?? 0) campground](inflect: true)")
            }
            
            HStack{
                Text("Sites first come first served:")
                Spacer()
                Text("^[\(Int(campground.numberOfSitesFirstComeFirstServe) ?? 0) campground](inflect: true)")
            }
        }.padding()
    }
}

#Preview {
    DetailView(campground: Campsite.exampleCampsite)
}
