//
//  Episode.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import UIKit

// MARK:- CLASS METHOD
// TODO: I preffered class NSObject because I was using userdefault to decode and encode
class Episode: NSObject, Codable {
    enum CodingKeys : String, CodingKey {
        case title = "title"
        case imageUrl = "artwork_url_retina"
        case genre = "genre"
    }
    
    // to manually decode eg. from payload "artwork_url_retina" to imageUrl
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        imageUrl = try values.decode(String.self, forKey: .imageUrl)
        genre = try values.decode(String.self, forKey: .genre)
    }

    var title: String?
    var imageUrl: String?
    var genre: String?
}

// MARK:- STRUCT METHOD
/*
 struct Episode: Codable {
 
 enum CodingKeys : String, CodingKey {
 case title = "title"
 case imageUrl = "artwork_url_retina"
 case genre = "genre"
 }
 
 init(from decoder: Decoder) throws {
 let values = try decoder.container(keyedBy: CodingKeys.self)
 title = try values.decode(String.self, forKey: .title)
 imageUrl = try values.decode(String.self, forKey: .imageUrl)
 genre = try values.decode(String.self, forKey: .genre)
 }
 
 var title: String?
 var imageUrl: String?
 var genre: String?
 }
 */










