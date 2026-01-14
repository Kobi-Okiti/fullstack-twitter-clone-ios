//
//  NotificationCellViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 19/12/2025.
//

import SwiftUI

class NotificationsViewModel: ObservableObject{
    
    @Published var notifications = [Notification]()
    
    let user: User
    
    init(user: User){
        self.user = user
        fetchNotifications()
    }
    
    func fetchNotifications() {
        RequestServices.requestDomain = "http://localhost:3000/notifications/\(self.user.id)"
        
        RequestServices.fetchData { result in
            switch result {
            case .success(let data):
                guard let notifications = try? JSONDecoder().decode([Notification].self, from: data as! Data) else {return}
                DispatchQueue.main.async {
                    self.notifications = notifications
                }
                print(notifications)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
