//
//  ProfileViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 16/12/2025.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var tweets = [Tweet]()
    
    init(user: User){
        self.user = user
        fetchTweets()
        checkIfUserIsCurrentUser()
    }
    
    func fetchTweets(){
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.user.id)"
        
        RequestServices.fetchTweet { res in
            switch res {
            case .success(let data):
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else {return}
                DispatchQueue.main.async {
                    self.tweets = tweets
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkIfUserIsCurrentUser(){
        if (self.user.id == AuthViewModel.shared.currentUser?.id) {
            self.user.isCurrentUser = true
        }
    }
}
