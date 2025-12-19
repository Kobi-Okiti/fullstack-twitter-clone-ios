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
        RefreshableScrollView(content:
            ScrollView(.vertical, showsIndicators: false,
                       content: {
                LazyVStack(spacing: 18) {
                    ForEach(viewModel.tweets){ tweet in
                        TweetCellView(viewModel: TweetCellViewModel(tweet: tweet, currentUser: user ))
                        
                        Divider()
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .zIndex(0)
            })
        ) { control in
            DispatchQueue.main.async{
                self.viewModel.fetchTweets()
                control.endRefreshing()
            }
        }
    }
}

