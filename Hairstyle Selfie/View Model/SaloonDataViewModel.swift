//
//  SaloonDataViewModel.swift
//  Hairstyle Selfie
//
//  Created by techunity on 09/01/23.


import Foundation
import UIKit

class APIClient {
    func request<T: Codable>(URL_String:String,MethodType:String, modelType: T.Type, parameters: [String: Any],completion: @escaping(T) -> Void) {

        func parseResponse(data: Data){
            let decoder = JSONDecoder()
            do{
              let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                  completion(decodedData)
                }
            } catch {
               print(error)
            }
        }

        guard let url = URL(string: URL_String) else {return}
        var request = URLRequest(url: url)
        if MethodType == "POST"
        {
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let parametersToSend = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            else {
                print("Error")
                return
            }
            request.httpBody = parametersToSend
        }else if MethodType == "GET"
        {
            request.httpMethod = "GET"
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
           if let safeData = data {
               let Str_data = String(decoding: safeData, as: UTF8.self)
               //                print("Response for POST Login ", Str_data)
              parseResponse(data: safeData)
            }
       }.resume()
    }

}
