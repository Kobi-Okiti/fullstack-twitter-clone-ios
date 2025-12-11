//
//  CreateTweetViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 11/12/2025.
//

import SwiftUI

class CreateTweetViewModel: ObservableObject {
    func uploadPost(text: String){
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            print(result)
        }
    }
}
