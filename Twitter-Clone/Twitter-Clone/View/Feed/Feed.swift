//
//  Feed.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false,
                   content: {
            VStack(spacing: 18) {
                TweetCellView(tweet: "Hey Tim, are those regular glassses?", tweetImage: "post")
                
                Divider()
                
                ForEach(0..<20, id: \.self) { _ in
                    TweetCellView(tweet: sampleText)
                    Divider()
                }
            }.padding(.top)
                .padding(.horizontal)
                .zIndex(0)
        })
    }
}

#Preview {
    Feed()
}
