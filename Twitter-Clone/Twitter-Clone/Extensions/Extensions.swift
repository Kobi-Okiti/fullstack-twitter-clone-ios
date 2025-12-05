//
//  Extensions.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 28/11/2025.
//

import UIKit
import SwiftUI

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View{
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
