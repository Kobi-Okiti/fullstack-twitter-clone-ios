//
//  Feed.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct Feed: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    let user : User
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false,
                   content: {
            LazyVStack(spacing: 18) {
                ForEach(viewModel.tweets){ tweet in
                    TweetCellView(tweet: tweet.text)
                    
                    Divider()
                }
            }.padding(.top)
                .padding(.horizontal)
                .zIndex(0)
        })
    }
}

