//
//  SearchView.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 27/11/2025.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    @State var isEditing = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var users: [User] {
        return text.isEmpty ? viewModel.users : viewModel.filterUsers(text)
    }
    
    var body: some View {
        VStack{
            SearchBar(text: $text, isEditing: $isEditing)
                .padding(.vertical)
                .padding(.horizontal)
            LazyVStack{
                ForEach(users){ user in
                    NavigationLink(destination: UserProfile(user: user)){
                        SearchUserCell(user: user)
                            .padding(.leading)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
