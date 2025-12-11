//
//  Twitter_CloneApp.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

@main
struct Twitter_CloneApp: App {
    
    init(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
