//
//  IGFeedPostActionsTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/27.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

protocol IGFeedPostActionsTableViewCellDelegate: AnyObject {
    
    func didTapLikeButton()
    func didTapCommentButton()
    func didTapSendButton()
}

class IGFeedPostActionsTableViewCell: UITableViewCell {
    
    weak var delegate: IGFeedPostActionsTableViewCellDelegate?
    
    static let identifier = "IGFeedPostActionsTableViewCell"
    
    private let likeButton: UIButton = {
       
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    private let commentButton: UIButton = {
       
        let button = UIButton()
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .label
        
        return button
        
    }()
    
    private let sendButton: UIButton = {
       
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .systemGreen
        
        return button
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(sendButton)
        
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
    }
    
    @objc private func didTapLikeButton(){
        delegate?.didTapLikeButton()
    }
    @objc private func didTapCommentButton(){
        delegate?.didTapCommentButton()
    }
    @objc private func didTapSendButton(){
        delegate?.didTapSendButton()
    }
    
    // customCellの細かい設定
    public func configure(with post: UserPost) {
        
        // confiogure cell
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
         // like, comment, send
        let buttonSize = contentView.height - 10
        
        let buttons = [likeButton, commentButton, sendButton]
        for x in 0..<buttons.count {
            let button = buttons[x]
            button.frame = CGRect(x: (CGFloat(x)*buttonSize) + (10*CGFloat(x+1)), y: 5, width: buttonSize, height: buttonSize)
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
