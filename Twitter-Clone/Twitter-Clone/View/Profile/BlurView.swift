//
//  BlurView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 03/12/2025.
//

import SwiftUI

struct BlurView:UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
