//
//  AuthServices.swift
//  Twitter-Clone
//
//  Created by Oghenekobiruo Okiti on 10/12/2025.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

public class AuthServices {
    
    public static var requestDomain = ""
    
    static func login(email: String, password: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void){
        let urlString = URL(string: "http://localhost:3000/users/login")!
        
        makeRequest(urlString: urlString, reqBody: ["email": email, "password": password]) { res in
            switch res {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    static func register(email: String, username: String, password: String, name: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void){
        let urlString = URL(string: "http://localhost:3000/users")!
        
        makeRequest(urlString: urlString, reqBody: ["email": email, "username": username, "password": password, "name": name]){ result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
            }
        }
        
    }
    
    static func makeRequest(urlString: URL, reqBody: [String: Any], completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void){
        let session = URLSession.shared
        
        var request = URLRequest(url: urlString)
        
        request.httpMethod = "POST"
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        }
        catch let error {
            print(error)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else{
                completion(.failure(.noData))
                return
            }
            guard let data = data else{
                return
            }
            completion(.success(data))
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    
                }
            }
            catch let error {
                completion(.failure(.decodingError))
                print(error)
            }
        }
        task.resume()
    }
    
//    Fetch User Function
    static func fetchUser(completion: @escaping(_ result: Result<Data?, AuthenticationError>) -> Void){
        
        let url = URL(string: requestDomain)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, res, err in
            
            // ❌ If there's an error, handle it
            if let err = err {
                print("Fetch user error:", err.localizedDescription)
                completion(.failure(.invalidCredentials))
                return
            }
            
            // ❌ If data is missing, fail
            guard let data = data else {
                completion(.failure(.invalidCredentials))
                return
            }

            // ✅ Success
            completion(.success(data))
            
        }.resume()
    }

    static func makePatchRequestWithAuth(urlString: URL, reqBody: [String: Any], completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void){
        let session = URLSession.shared
        var request = URLRequest(url: urlString)
        request.httpMethod = "PATCH"
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        }
        catch let error{
            print(error)
        }
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else { return }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]{
                    
                }
            }
            catch let error{
                completion(.failure(.decodingError))
                print(error)
            }
        }
        task.resume()
    }
    
}
