//
//  APIService.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import Foundation

class APIService {
    
    let baseUrl = "https://api-v2.hearthis.at"
    
   
    static let shared = APIService()
    
    func fetchTracks(completion: @escaping ([Episode]) -> ()) {
        let urlString = "\(baseUrl)/set/90814-9060421/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    print("Failed to fetch courses:", err)
                    return
                }
            
                guard let data = data else { return }
                do {
                    let episodes = try JSONDecoder().decode([Episode].self, from: data)
                    DispatchQueue.main.async {
                        completion(episodes)
                    }
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }.resume()
    }
    
    func fetchGenericData<T: Decodable>(completion: @escaping (T) -> ()) {
        let urlString = "\(baseUrl)/set/90814-9060421/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    print("Failed to fetch courses:", err)
                    return
                }
            
                guard let data = data else { return }
                do {
                    let obj = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(obj)
                    }
                } catch let jsonErr {
                    print("Failed to decode:", jsonErr)
                }
            }.resume()
    }
}














