//
//  MainView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Color(.black)
//                .ignoresSafeArea()
            Image("camp")
            VStack{
                Text("MAD 432")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                Text("Camping App")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    MainView()
}
