//
//  ProfileViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 16/12/2025.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User){
        self.user = user
    }
}
