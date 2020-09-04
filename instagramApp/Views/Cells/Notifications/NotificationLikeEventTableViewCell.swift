//
//  NotificationLikeEventTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/09/03.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import SDWebImage
import UIKit

protocol NotificationLikeEventTableViewCellDeleagate {
    
    func didTapRelatedPostButton(model: UserNotification)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    
    static let identfifier = "NotificationLikeEventCell"
    
    weak var delegate: NotificationFollowEventTableViewCellDelegate?
    
    private var model: UserNotification?
    
    private let profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "test")
        
        return imageView
    }()
    
    private let label: UILabel = {
       
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "@joe liked your photo."
        
        return label
        
    }()
    
    private let postButton: UIButton = {
       
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "test"), for: .normal)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(postButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // photo text postButton
        
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height-6, height: contentView.height-6)
        profileImageView.layer.cornerRadius = profileImageView.height/2
        
        let size = contentView.height - 4
        postButton.frame = CGRect(x: contentView.width - size - 5, y: 2, width: size, height: size)
        
        label.frame = CGRect(x: profileImageView.right + 5, y: 0, width: contentView.width - size - profileImageView.width - 16, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        label.text = nil
        
        postButton.setBackgroundImage(nil, for: .normal)
    }
    
    public func configure(with model: UserNotification) {
        
        self.model = model
        
        switch model.type {
            
        case .like(let post):
            let thumbnail = post.thumbnailImage
            
            guard !thumbnail.absoluteString.contains("google.com") else {
                return
            }
            
            postButton.sd_setImage(with: thumbnail, for: .normal, completed: nil)
            
        case .follow:
            break
        }
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
