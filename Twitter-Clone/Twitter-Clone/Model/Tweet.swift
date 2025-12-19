//
//  Tweet.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 11/12/2025.
//

import SwiftUI

struct Tweet: Identifiable, Decodable{
    let _id: String
    var id: String{
        return _id
    }
    let text: String
    let userId: String
    let username: String
    let user: String
    let image: String?
    var likes: [String]
    var didLike: Bool? = false
}
