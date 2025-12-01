//
//  MessagesView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack{
            ScrollView(){
                ForEach(0..<15){_ in
                   MessageCell()
                }
            }
        }
    }
}

#Preview {
    MessagesView()
}
