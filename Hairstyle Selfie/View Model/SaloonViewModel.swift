//
//  DashboardViewModel.swift
//  Gmap2
//
//  Created by iOS Developer on 05/01/23.
//

import Foundation
class DashboardViewModel{
    
    var SaloonData = Saloons()
    var SaloonPhoneData = saloonPhone()

    private let PlaceURL = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=11.026040987217842%2C76.95830782341586&radius=1000&type=saloon&keyword=saloon&key=AIzaSyDOFIGDZDm87A0C9b3JZn2wPIqEVCyEbTM")!
    private let PlacePhoneURL = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJlWPmhxZZqDsRLnaJLd5Kwi4&fields=international_phone_number&key=AIzaSyDOFIGDZDm87A0C9b3JZn2wPIqEVCyEbTM")!
    func apiToGetSaloon(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: PlaceURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Saloons.self, from: data)
                self!.SaloonData = empData
                completion()
            }
        }.resume()
    }
    func apiToGetPhoneNumber(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: PlacePhoneURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(saloonPhone.self, from: data)
//                print(empData)
                self?.SaloonPhoneData = empData
                completion()
            }
        }.resume()
    }
}
