//
//  NotificationCellViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 19/12/2025.
//

import SwiftUI

class NotificationViewModel: ObservableObject{
    let user: User
    
    init(user: User){
        self.user = user
        fetchNotifications()
    }
    
    func fetchNotifications() {
        
    }
}
