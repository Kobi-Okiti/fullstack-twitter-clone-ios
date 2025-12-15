//
//  TweeCellViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 15/12/2025.
//

import SwiftUI

class TweeCellViewModel: ObservableObject {
    @Published var tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
}
