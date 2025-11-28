//
//  SearchUserCell.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 28/11/2025.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 44,height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading){
                Text("Cem")
                    .fontWeight(.heavy)
                Text("@oghenekobiruo")
            }
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    SearchUserCell()
}
