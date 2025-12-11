//
//  CreateTweetView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 28/11/2025.
//

import SwiftUI

struct CreateTweetView: View {
    
    @Binding var show : Bool
    @State var text = ""
    
    @ObservedObject var viewModel = CreateTweetViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {
                    if  text != ""{
                        self.viewModel.uploadPost(text: text)
                    }
                    self.show.toggle()
                }, label: {
                    Text("Tweet")
                        .padding()
                })
                .background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            MultilineTextField(text: $text)
        }.padding()
    }
}
