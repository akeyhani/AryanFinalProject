//
//  RowView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI

struct RowView: View {
    var campsite: Campsite
    var body: some View {
        HStack{
            Image(systemName: "tent")
                .font(.title)
            VStack(alignment: .leading){
                Text(campsite.name)
                    .font(.headline)
                Text(campsite.parkCode.uppercased())
                    .font(.callout)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RowView(campsite: Campsite.exampleCampsite)
}
