//
//  FollowView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 02/12/2025.
//

import SwiftUI

struct FollowView: View {
    var count: Int
    var title: String
    var body: some View {
        HStack{
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}

