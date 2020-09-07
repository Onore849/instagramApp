//
//  ExploreViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

enum UserNotificationType {
    
    case like(post: UserPost)
    case follow(state: FollowState)
}

struct UserNotification {
    
    let type: UserNotificationType
    let text: String
    let user: User
}

final class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.isHidden = false
        
        tableView.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.identfifier)
        tableView.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        
        return tableView
    
    }()
    
    private let spinner: UIActivityIndicatorView = {
       
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        
        return spinner
    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    private var models = [UserNotification]()
    
    // MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNotifications()
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        
        view.addSubview(spinner)
//        spinner.startAnimating()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func fetchNotifications() {
        
        for x in 0...100 {
            
            let user = User(
                username: "Hello world",
                name: (first: "", last: ""),
                birthDate: Date(),
                gender: .male,
                counts: UserCount(followers: 1, following: 1, posts: 1),
                bio: "",
                profilePhoto: URL(string: "https://www.google.com")!,
                joinDate: Date()
            )
            
            let post = UserPost(
                identifier: "",
                postType: .photo,
                thumbnailImage: URL(string: "https://www.google.com/")!,
                postURL: URL(string: "https://www.google.com/")!,
                caption: nil,
                likeCount: [],
                comments: [],
                createdDate: Date(),
                tabbedUsers: [],
                owner: user
            )
            
            let model = UserNotification(
                type: x % 2 == 0 ? .like(post: post) : .follow(state: .not_following),
                text: "Hello World",
                user: user)
            
            models.append(model)
        }
    }
    
    private func addNoNotificationsView() {
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.height/2)
        noNotificationsView.center = view.center
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        switch model.type {
            
        case .like(_):
             // like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identfifier, for: indexPath) as! NotificationLikeEventTableViewCell
            cell.delegate = self
            cell.configure(with: model)
            
            return cell
            
        case .follow:
            // follow cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier, for: indexPath) as! NotificationFollowEventTableViewCell
//            cell.configure(with: model)
            cell.delegate = self
            
            return cell

    }
    

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }

}

extension NotificationsViewController: NotificationLikeEventTableViewCellDeleagate {
    func didTapRelatedPostButton(model: UserNotification) {
        
        switch model.type {
        case .like(post: let post):
            // Open the post
            let vc = PostViewController(model: post)
            vc.title = post.postType.rawValue
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
            
        case .follow( _ ):
            fatalError("Dev Issue: Should never get called")

        }
        
    }
    
}

extension NotificationsViewController: NotificationFollowEventTableViewCellDelegate {
    func didTapFollowUnFollowButton(model: UserNotification) {
        
        print("tapped button")
        // perform database update
    }
    
        
    
}
