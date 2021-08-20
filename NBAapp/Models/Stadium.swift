//
//  Stadium.swift
//  NBAapp
//
//  Created by Nicholas Gilbert on 8/20/21.
//

import Foundation

struct Stadium: Decodable {
    let stadiumID: Int
    let active: Bool
    let name: String?
    let address: String?
    let city: String?
    let state: String?
    let zip: String?
    let capacity: Int?
    let lat: Double?
    let log: Double?
    
    private enum CodingKeys: String, CodingKey {
        case stadiumID = "StadiumID"
        case active = "Active"
        case name = "Name"
        case address = "Address"
        case city = "City"
        case state = "State"
        case zip = "Zip"
        case capacity = "Capacity"
        case lat = "GeoLat"
        case log = "GeoLong"
    }
    
}
