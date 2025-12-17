//
//  TweetCellView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 28/11/2025.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    
    @ObservedObject var viewModel: TweetCellViewModel
    
    init(viewModel: TweetCellViewModel){
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        VStack(spacing: 15){
            HStack(alignment: .top, spacing: 10, content: {
                if let user = viewModel.user {
                    NavigationLink(destination: UserProfile(user: user)) {
                        KFImage(URL(string: "http://localhost:3000/users/\(self.viewModel.tweet.userId)/avatar"))
                            .placeholder({
                                Image("blankpp")
                                    .resizable()
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                }
                VStack(alignment: .leading, spacing: 10,
                       content: {
                    (
                        Text("\(self.viewModel.tweet.username) ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("@\(self.viewModel.tweet.username)")
                            .foregroundColor(.gray)
                    )
                    
                    Text(self.viewModel.tweet.text)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if viewModel.tweet.image == "true"{
                        GeometryReader { proxy in
                            KFImage(URL(string: "http://localhost:3000/tweets/\(viewModel.tweet.id)/image"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width, height: 250)
                                .cornerRadius(15)
                        }
                        .frame(height: 250)
                    }
                })
                Spacer()
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
