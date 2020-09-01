//
//  StrageManager.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        
        case failedToDownload
        
    }
    
    // MARK: - Public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManagerError>) -> Void) {
        
        bucket.child(reference).downloadURL( completion: { (url, error) in
            
            guard let url = url, error == nil else {
                
                completion(.failure(.failedToDownload))
                
                return
            }
            
            completion(.success(url))
        })
        
    }
    
}

