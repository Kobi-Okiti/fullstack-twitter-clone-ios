//
//  Home.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct Home: View {
    
    @State var selectedIndex = 0
    @State var showCreateTweet = false
    @State var text = ""
    
    let user : User
    
    var body: some View {
        VStack {
            ZStack {
                TabView(selection: $selectedIndex){
                    Feed(user: user)
                        .tag(0)
                        .navigationBarHidden(true)
                        .tabItem {
                            Image("Home")
                                .renderingMode(selectedIndex == 0 ? .template : .original)
                                .foregroundColor(selectedIndex == 0 ? Color("bg") : .primary)
                        }
                    SearchView()
                        .tag(1)
                        .navigationBarHidden(true)
                        .tabItem {
                            Image("Search")
                                .renderingMode(selectedIndex == 1 ? .template : .original)
                                .foregroundColor(selectedIndex == 1 ? Color("bg") : .primary)
                        }
                    NotificationsView()
                        .tag(2)
                        .navigationBarHidden(true)
                        .tabItem {
                            Image("Notifications")
                                .renderingMode(selectedIndex == 2 ? .template : .original)
                                .foregroundColor(selectedIndex == 2 ? Color("bg") : .primary)
                        }
                    MessagesView()
                        .tag(3)
                        .navigationBarHidden(true)
                        .tabItem {
                            Image("Messages")
                                .renderingMode(selectedIndex == 3 ? .template : .original)
                                .foregroundColor(selectedIndex == 3 ? Color("bg") : .primary)
                        }
                }
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            self.showCreateTweet.toggle()
                        }, label: {
                            Image("Tweet").renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color("bg"))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        })
                    }
                    .padding()
                }
                .padding(.bottom, 65)
            }
            .sheet(isPresented: $showCreateTweet,
                   content: {
                CreateTweetView(show: $showCreateTweet, text: text)
            })
        }
    }
}

