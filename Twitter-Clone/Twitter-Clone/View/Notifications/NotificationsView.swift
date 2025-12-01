//
//  NotificationsView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack{
            ScrollView{
                ForEach(0..<10){ _ in
                    NotificationCell()
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
