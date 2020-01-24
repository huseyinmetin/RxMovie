//
//  WebService.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import Foundation

class WebService {
    
    static let baseURL = "https://api.themoviedb.org/3"
    static let baseImageURL = "https://image.tmdb.org/t/p"
    static let apiKey = "c26a27e9108041a58ec1093a8be20f7b"
    
    
    static func get<T: Decodable>(_ method: String, completion: ((T) -> Void)? = nil) {
        guard let url = URL(string: "\(baseURL)/\(method)?api_key=\(apiKey)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error!)
                return
            }
            
            do {
                let decoded = try JSONManager().decoder.decode(T.self, from: data)
                completion?(decoded)
            } catch {
                print(String(data: data, encoding: .utf8) ?? "", error)
                return
            }
            
        }.resume()
    }
    
}
