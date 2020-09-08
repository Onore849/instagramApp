//
//  ViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import FirebaseAuth

struct HomeFeedRenderViewModel {
    let header: PostRenderViewModel
    let post: PostRenderViewModel
    let actions: PostRenderViewModel
    let comments: PostRenderViewModel
}

class HomeViewController: UIViewController{
    
    private var feedRenderModels = [HomeFeedRenderViewModel]()
    
    // MARK:- Outlet
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        // Register cells
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        tableView.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.identifier)
        tableView.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMockModels()
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
                
    }
    
    private func createMockModels() {
        
        let user = User(
            username: "@Joe",
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
        
        var comments = [PostComment]()
        for x in 0..<2 {
            comments.append(
                PostComment(
                    identifier: "\(x)",
                    username: "@jenny",
                    text: "This is the best post I've seen",
                    createDate: Date(),
                    likes: []
                )
            )
        }
        
        for _ in 0..<5 {
            
            let viewModel = HomeFeedRenderViewModel(header: PostRenderViewModel(renderType: .header(provider: user)),
                                                    post: PostRenderViewModel(renderType: .primaryContent(provider: post)),
                                                    actions: PostRenderViewModel(renderType: .actions(provider: "")),
                                                    comments: PostRenderViewModel(renderType: .comments(comments: comments)))
            feedRenderModels.append(viewModel)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = tableView.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
    }
    
    
    // ログインしてなかったらログイン画面に遷移させる処理
    private func handleNotAuthenticated() {
        
        // check auth status
        if Auth.auth().currentUser == nil {
            
            // show log in
            let loginVC = LoginViewController()
            
            // 遷移した時の表示
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false)
        }
    
        
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
   func numberOfSections(in tableView: UITableView) -> Int {
       return feedRenderModels.count * 4
   }
   
    
    
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    let x = section
    let model: HomeFeedRenderViewModel
    
    if x == 0 {
        model = feedRenderModels[0]
    }
    else {
        let position = x % 4 == 0 ? x / 4 : ((x - (x % 4)) / 4)
        model = feedRenderModels[position]
    }
    
    
    let subSection = x % 4
    
    if subSection == 0 {
        // header
        return 1
    }
    else if subSection == 1 {
        // post
        return 1
    }
    else if subSection == 2 {
        // actions
        return 1
    }
    else if subSection == 3 {
        // comments
        let commntModel = model.comments
        switch commntModel.renderType {
            
        case .comments(let comments):
            comments.count > 2 ? 2 :
                comments.count
        case .header, .actions, .primaryContent :
            return 0
        }
    }
    
    return 0
   }
   
    
    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
    let x = indexPath.section
    let model: HomeFeedRenderViewModel
    if x == 0 {
        model = feedRenderModels[0]
    }
    else {
        let position = x % 4 == 0 ? x / 4 : ((x - (x % 4)) / 4)
        model = feedRenderModels[position]
    }
    
    
    let subSection = x % 4
    if subSection == 0 {
        // header
        switch model.header.renderType {
        case .header(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.identifier, for: indexPath) as! IGFeedPostHeaderTableViewCell
            cell.configure(with: user)
            cell.delegate = self
            
            return cell
        case .comments, .actions, .primaryContent:
            return UITableViewCell()
    }
    }
        
    else if subSection == 1 {
        // post
        
        switch model.post.renderType {
            
        case .primaryContent(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell
            
            cell.configure(with: post)
            
            return cell
            
        case .comments, .actions, .header :
            return UITableViewCell()
    }
    }
        
    else if subSection == 2 {
        // actions
        
        switch model.actions.renderType {
        case .actions(let provider):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.identifier, for: indexPath) as! IGFeedPostActionsTableViewCell
            
            cell.delegate = self
            
            return cell
        case .comments, .header, .primaryContent :
            return UITableViewCell()
    }
    }
        
    else if subSection == 3 {
        // comments
        
        switch model.comments.renderType {
        case .comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.identifier, for: indexPath) as! IGFeedPostGeneralTableViewCell
            
            return cell
        case .header, .actions, .primaryContent :
            return UITableViewCell()
        }
        }
    
    return UITableViewCell()
    }
   
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
   }
   
    
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    let subSection = indexPath.section % 4
    
    if subSection == 0 {
        // Header
        return 70
    }
    else if subSection == 1 {
        // posts
        return tableView.width
    }
    else if subSection == 2 {
        // actions(like/comments)
        return 60
    }
    else if subSection == 3 {
        // commetn row
        return 50
    }
    return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        let subSection = section % 4
        return subSection == 3 ? 70 : 0
        
    }
}

extension HomeViewController:  IGFeedPostHeaderTableViewCellDelegate  {
    
    func didTapMoreButton() {
        
        let actionSheet = UIAlertController(title: "Post Options", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Report Post", style: .destructive, handler: { [weak self] _ in
            
            self?.reportPost()
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Report", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    func reportPost() {
        
    }
    
    
}

extension HomeViewController: IGFeedPostActionsTableViewCellDelegate {
    
    func didTapLikeButton() {
        print("like")
    }
    
    func didTapCommentButton() {
        print("comment")
    }
    
    func didTapSendButton() {
        print("send")
    }
    
    
    
}
