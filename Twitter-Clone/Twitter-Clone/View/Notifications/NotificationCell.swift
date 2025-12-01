//
//  NotificationCell.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 01/12/2025.
//

import SwiftUI

struct NotificationCell: View {
    
    @State var width = UIScreen.main.bounds.width
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
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .cornerRadius(18)
                    Text("Cem ")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    +
                    Text("followed you")
                        .foregroundColor(.black)
                })
                Spacer(minLength: 0)
            }
            .padding(.leading, 30)
        }
    }
}

#Preview {
    NotificationCell()
}
