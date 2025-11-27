//
//  Home.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ZStack {
                TabView{
                    Feed()
                        .tabItem {
                            Image("Home")
                        }
                    SearchView()
                        .tabItem {
                            Image("Search")
                        }
                    NotificationsView()
                        .tabItem {
                            Image("Notifications")
                        }
                    MessagesView()
                        .tabItem {
                            Image("Messages")
                        }
                }
            }
        }
    }
}

#Preview {
    Home()
}
