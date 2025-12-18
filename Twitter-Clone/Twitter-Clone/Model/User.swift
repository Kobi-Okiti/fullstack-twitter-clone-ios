//
//  User.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 10/12/2025.
//

import Foundation

struct ApiResponse: Decodable{
    var user: User
    var token: String
}

struct User: Codable, Identifiable {
    let id: String
    let username: String
    var name: String
    let email: String
    var location: String?
    var bio: String?
    var website: String?
    var avatarExists: Bool?
    var followers: [String]
    var followings: [String]
    var isCurrentUser: Bool? = false

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username
        case name
        case email
        case location
        case bio
        case website
        case avatarExists
        case followers
        case followings
        case isCurrentUser
    }
}

