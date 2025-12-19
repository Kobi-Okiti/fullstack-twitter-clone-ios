//
//  SearchViewModel.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 19/12/2025.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        AuthServices.requestDomain = "http://localhost:3000/users"
        
        AuthServices.fetchUser(id: "") { result in
            switch result{
            case .success(let data):
                guard let users = try? JSONDecoder().decode([User].self, from: data as! Data) else {return}
                
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.name.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
}
