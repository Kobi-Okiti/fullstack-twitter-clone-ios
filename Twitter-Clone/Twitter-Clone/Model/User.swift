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

struct User: Decodable, Identifiable {
    var _id: String
    var id: String {
        return _id
    }
    let username: String
    let name: String
    let email: String
    var location: String?
    var bio: String?
    var website: String?
    var avatarExists: String?
    var followers: [String]
    var followings: [String]
}
