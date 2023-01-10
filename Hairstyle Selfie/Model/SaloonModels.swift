//
//  SaloonModels.swift
//  Hairstyle Selfie
//
//  Created by iOS Developer on 07/01/23.
//

import Foundation

struct Saloons: Codable{
    var results = [Results]()
}
struct Results: Codable{

    var name = String()
    var geometry = geometryInfo()
    var place_id = String()
    var vicinity = String()
    var call : String?
}
struct geometryInfo: Codable{

    var location = LocationInfo()
}
struct LocationInfo: Codable{

    var lat = Double()
    var lng = Double()
}
struct saloonPhone: Codable{
    var result : [String:String]?
}
// MARK: - Welcome
struct Barbershops: Codable {
    let saloonID, barberID, name, mobileNumber: String
    let address, services: String
    let setvicesCount: Int
}

struct CommonResponse:Codable {
    var sessionID: String?
   var response: String?
   var result: String?
   var errormessage: String?
    
}

struct LoginResponse:Codable {
    
    var guid = String()
    
}
