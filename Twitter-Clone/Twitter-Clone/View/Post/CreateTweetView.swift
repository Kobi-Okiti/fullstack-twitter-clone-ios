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
    @State var imagePickerPresented = false
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var width = UIScreen.main.bounds.width
    
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
                        self.viewModel.uploadPost(text: text, image: selectedImage)
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
            
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .padding(.top)
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
            }
            else if let image = postImage {
                VStack{
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width: width * 0.9)
                            .cornerRadius(16)
                            .clipped()
                    }
                    Spacer()
                }
            }

            
        }.padding()
    }
}

extension CreateTweetView {
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}
