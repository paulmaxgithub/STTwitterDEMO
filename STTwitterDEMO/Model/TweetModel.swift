//
//  TweetModel.swift
//  STTwitterDEMO
//
//  Created by PaulmaX on 20.12.22.
//

import Foundation

struct Tweet: Codable {
    let text: String
    let user: User
}

struct User: Codable {
    let name: String
    let profileImageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case profileImageURL = "profile_image_url_https"
    }
}
