//
//  Models.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/09/01.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User {
    
    let username: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let bio: String
    let profilePhoto: URL
    let joinDate: Date
}

struct  UserCount {
    
    let followers: Int
    let following: Int
    let posts: Int
}


public enum UserPostType {
    
    case photo, video
    
}

/// Represent user post
public struct UserPost {
    
    let identifier: String
    let postType: UserPostType // either video or full resolution photo
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLikes]
    let comments: [PostComment]
    let createdDate: Date
    let tabbedUsers: [String]
}



struct PostLikes {
    let username: String
    let postIndentifier: String
}

struct CommentLikes {
    let username: String
    let commentIndentifier: String
}

struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes: [CommentLikes]
    
}

