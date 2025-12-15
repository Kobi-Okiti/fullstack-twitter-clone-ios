//
//  FeedViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 14/12/2025.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.fetchTweet { result in
            switch result {
            case .success(let data):
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else {return}
                DispatchQueue.main.async{
                    self.tweets = tweets
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
