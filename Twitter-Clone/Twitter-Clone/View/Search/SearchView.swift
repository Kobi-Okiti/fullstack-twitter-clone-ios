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
    var body: some View {
        VStack{
            SearchBar(text: $text, isEditing: $isEditing)
                .padding(.horizontal)
            List(0..<9){ i in
                SearchCell(tag: "Helo", tweets: String(i))
            }
        }
    }
}

#Preview {
    SearchView()
}
