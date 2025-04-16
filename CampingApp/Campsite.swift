//
//  Campsite.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import Foundation

struct Campsites:Codable{
    var data : [Campsite]
}

struct Campsite:Codable, Identifiable{
    
    static var exampleCampsite = Campsite(id: "E7CC7363-9C34-42ED-B3F0-769BB39E9400", name: "Anacapa Island Campground", description: "Primitive camping is available (seven sites; $15 per night per site; reservations required). Picnic table, food storage box, and pit toilet are provided. No water is available. Distance from landing to campground is one-half mile and includes a 157-stair climb. WARNING: Western gulls nest on Anacapa Island From April through mid-August. During this time, visitors will encounter seabird rookery conditions: guano, strong odor, constant noise, bird carcasses, and birds protecting their territory.", parkCode: "chis", numberOfSitesReservable: "7", numberOfSitesFirstComeFirstServe: "1")
    
    var id: String
    var name: String
    var description: String
    var parkCode: String
    var numberOfSitesReservable: String
    var numberOfSitesFirstComeFirstServe: String
}

extension Bundle{
    func decode(_ file: String) -> [Campsite]{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Can't locate this file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't convert the url to data")
        }
        guard let campsites = try? JSONDecoder().decode(Campsites.self, from: data) else {
            fatalError("Can't decode - problem with keys and properties or values")
        }
        
        return campsites.data
    }
}
