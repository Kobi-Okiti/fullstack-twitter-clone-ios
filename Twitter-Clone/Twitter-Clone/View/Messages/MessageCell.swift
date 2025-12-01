//
//  MessageCell.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 01/12/2025.
//

import SwiftUI

struct MessageCell: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            HStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack{
                        Text("Cem ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("@oghenekobiruo")
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Text("6/20/21")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    Text("You: Hey! How is it going?")
                        .foregroundColor(.gray)
                    Spacer()
                })
            }
            .padding(.top, 2)
        })
        .frame(width: width, height: 84)
    }
}

#Preview {
    MessageCell()
}
