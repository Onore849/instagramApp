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
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         - Check if username is available
         - Check if email is available
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { (canCreate) in
            
            if canCreate {
                
                /*
                 - Create Account
                 - Insert account to database
                 */
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                    guard error != nil, result != nil else {
                        
                        // Firebase auth could not create account
                        completion(false)
                        return
                    }
                    
                    // Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        
                        if inserted {
                            
                            completion(true)
                            
                            return
                            
                        }
                        else {
                            
                            // Failed to insert to database
                            completion(false)
                            
                            return
                            
                        }
                        
                        
                    }
                    
                    
                }
                
            }
            else {
                
                // either username or email does not exist
                completion(false)
                
            }
        }
        
        
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
    
    
    // MARK:- LogOut
    /// Attempt to log out firebase user
    public func logOut(completion: (Bool) -> Void) {
        
        do {
            
            try Auth.auth().signOut()
            
            // SignOutが成功: 戻り値は無し
            completion(true)
            return
            
        }
        catch {
            
            print(error)
            
            // signOutが失敗: 戻り値はなし
            completion(false)
            
        }
        
        
    }
    
    
}
