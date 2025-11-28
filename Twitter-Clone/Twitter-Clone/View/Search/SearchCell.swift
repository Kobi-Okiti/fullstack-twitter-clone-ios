//
//  SearchCell.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 28/11/2025.
//

import SwiftUI

struct SearchCell: View {
    var tag = ""
    var tweets = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5,
               content: {
            Text("hello").fontWeight(.heavy)
            Text(tweets + " Tweets").fontWeight(.light)
        })
    }
}

#Preview {
    SearchCell()
}
