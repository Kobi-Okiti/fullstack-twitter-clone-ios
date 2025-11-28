//
//  TweetCellView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 28/11/2025.
//

import SwiftUI

struct TweetCellView: View {
    var tweet: String
    var tweetImage: String?
    var body: some View {
        VStack(spacing: 0){
            HStack(alignment: .top, spacing: 10, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10,
                       content: {
                    (
                        Text("Travis ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("@oghenekobiruo")
                            .foregroundColor(.gray)
                    )
                    
                    Text(tweet)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if let image = tweetImage {
                        GeometryReader { proxy in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width, height: 250)
                                .cornerRadius(15)
                        }
                        .frame(height: 250)
                        .padding(.bottom, 15)
                    }
                })
            })
//            Cell Bottom
            HStack(spacing: 50,content: {
                Button(action: {
                    
                }, label: {
                    Image("Comments").resizable()
                        .renderingMode(.template)
                        .frame(width: 16, height: 16)
                }).foregroundColor(.gray)
                Button(action: {
                    
                }, label: {
                    Image("Retweet").resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 14)
                }).foregroundColor(.gray)
                Button(action: {
                    
                }, label: {
                    Image("love").resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
                Button(action: {
                    
                }, label: {
                    Image("upload").resizable()
                        .renderingMode(.template)
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
            })
        }
    }
}

#Preview {
    TweetCellView(tweet: sampleText, tweetImage: "post")
}

var sampleText = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem ex commodi fuga consequuntur maiores dolorum, quam, temporibus possimus laudantium odio ut sit animi, numquam assumenda! Assumenda eum asperiores enim quae."
