//
//  NotificationCell.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 01/12/2025.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @State var width = UIScreen.main.bounds.width
    
    let notification: Notification
    
    var body: some View {
        VStack(spacing: 10){
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            HStack(alignment: .top){
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                VStack(alignment: .leading, spacing: 5, content: {
                    KFImage(URL(string: "http://localhost:3000/users/\(notification.notSenderId)/avatar"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .cornerRadius(18)
                    Text("\(notification.username) ")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    +
                    Text(notification.notificationType.rawValue == "like" ? NotificationType.like.notificationMessage : NotificationType.follow.notificationMessage)
                        .foregroundColor(.black)
                })
                Spacer(minLength: 0)
            }
            .padding(.leading, 30)
        }
    }
}

