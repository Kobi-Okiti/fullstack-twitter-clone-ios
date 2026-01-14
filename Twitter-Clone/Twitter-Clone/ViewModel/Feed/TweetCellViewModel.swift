//
//  TweeCellViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 15/12/2025.
//

import SwiftUI

class TweetCellViewModel: ObservableObject {
    @Published var tweet: Tweet
    @Published var user: User?
    let currentUser: User
    
    init(tweet: Tweet, currentUser: User){
        self.tweet = tweet
        self.currentUser = currentUser 
        self.fetchUser(userId: tweet.user)
        checkIfUserLikedPost()
    }
    
    func fetchUser(userId: String){
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        
        AuthServices.fetchUser(id: userId) { res in
            switch res {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else {return}
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func like(){
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/like"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("Tweet has been liked")
        }
        
        RequestServices.requestDomain = "http://localhost:3000/notifications"
        RequestServices.sendNotification(username: self.currentUser.username, notSenderId: self.currentUser.id, notReceiverId: self.tweet.userId, notificationType: NotificationType.like.rawValue, postText: "") { result in
            print(result)
        }
        
        self.tweet.didLike = true
    }
    
    func unlike(){
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/unlike"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("Tweet has been unliked")
        }
        
        self.tweet.didLike = false
    }
    
    func checkIfUserLikedPost(){
        if(self.tweet.likes.contains(self.currentUser.id)){
            self.tweet.didLike = true
        }
        else{
            self.tweet.didLike = false
        }
    }
    
}
