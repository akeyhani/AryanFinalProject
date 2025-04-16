//
//  Campsite.swift
//  CampingApp
//
//  Created by Christopher Takaki on 2025-03-17.
//

import Foundation

struct Campsites:Codable{
    var data: [Campsite] = []
}

struct Campsite: Codable, Hashable, Identifiable{
    
    static let exampleCampsite = Campsite(id: "1", name: "My Example Park Name", parkCode: "MEPN", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu erat interdum turpis varius congue. Maecenas faucibus dolor elit, eget luctus tellus sodales id. Vestibulum dignissim mauris neque, ut ultricies tellus tempor in. Proin ut finibus risus, ut tincidunt nulla. Nulla faucibus, lorem id accumsan lobortis, augue lectus mollis arcu, non interdum eros nunc et tellus. Donec eros quam, facilisis eu porttitor sit amet, posuere sed nisl. Quisque quis ante at quam pharetra consectetur a nec mi. Nam eget mi tellus. Proin feugiat, felis ut pharetra maximus, odio tellus euismod sapien, vitae mollis eros dui in purus. Aenean ac sagittis ex, non suscipit ligula. Nulla rutrum eros eu orci faucibus, in finibus arcu porta. Suspendisse suscipit metus gravida metus dapibus, sit amet varius risus molestie. In laoreet, turpis dapibus lacinia interdum, orci justo rhoncus velit, eu pellentesque sem magna in eros. Fusce molestie elit at ipsum laoreet, ut tempus turpis mattis", latitude: "42.2465", longitude: "-83.0191", images: [CampImage(title: "Image1", url: "https://www.nps.gov/common/uploads/structured_data/3C802F23-1DD8-B71B-0B681A0ACFF92DE5.jpg"), CampImage(title: "Image2", url: "https://www.nps.gov/common/uploads/structured_data/118C3320-CCCD-908E-795691AA221C18C0.jpg"), CampImage(title: "Image3", url: "https://www.nps.gov/common/uploads/structured_data/1197DAEA-ACF9-1E84-906636BD62214BE9.jpg")], reservationUrl: nil)
    var id: String
    var name: String
    var parkCode: String
    var description: String
    var latitude: String
    var longitude: String
    var images: Set<CampImage>
    var reservationUrl: String?
    var rating: Int?
}
extension Campsite{
    var allImages:[CampImage]{
        return Array(images)
    }
}

struct CampImage: Codable, Hashable{
    var title: String
    var url: String
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
