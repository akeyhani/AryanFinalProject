//
//  ContentView.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import SwiftUI

struct ContentView: View {
    @State private var sheetIsShowing = false
    @State private var searchText  = "MI"
    
    //MARK: - Properties
//    let campsites: [Campsite] = Bundle.main.decode("allParks.json")
    @State private var campsites: [Campsite] = []
    
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
            .onAppear(){
                loadData(usingStateCode: searchText)
            }
            .searchable(text: $searchText, prompt: "Enter two letter state code")
            .keyboardType(.default)
            .textInputAutocapitalization(.characters)
            .onSubmit(of: .search, {
                loadData(usingStateCode: searchText)
            })
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
    
    //MARK: - Search function
    func loadData(usingStateCode stateCode: String){
        Task{
            guard let cleanText = stateCode.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return }
            var urlString = "https://developer.nps.gov/api/v1/campgrounds?stateCode=\(cleanText)&api_key="
            urlString = urlString.appending(API_KEY_GOES_HERE)
            
//            print(urlString)
            
            guard let url = URL(string: urlString) else {
                return
            }
            
            do{
                let (data, _) =  try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(Campsites.self, from: data)
                campsites = results.data
                
            } catch DecodingError.valueNotFound(let error, let message){
               print( "Value is missing: \(error) - \(message.debugDescription)")
            } catch DecodingError.typeMismatch(let error, let message){
                print( "Types do not match: \(error)- \(message.debugDescription)")
            } catch DecodingError.keyNotFound(let error, let message){
               print( "Incorrect property name: \(error)- \(message.debugDescription)")
            } catch {
               print( "Unknown error has occurred- \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView()
}


