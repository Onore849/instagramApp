//
//  AuthManager.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String) {
        
        
    }
    
    public func loginUser(username: String?, email: String?, passWord: String, completion: @escaping ((Bool) -> Void)) {
        
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: passWord) { (authResult, error) in
                
                guard authResult != nil, error == nil else {
                    
                    completion(false)
                    
                    return
                }
                
                completion(true)
            }
            
        }
        else if let username = username {
            // username log in
            print(username)
            
        }
        
    }
    
    
}
