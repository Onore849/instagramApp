//
//  NotificationFollowEventTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/09/03.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

protocol NotificationFollowEventTableViewCellDelegate: AnyObject {
    
    func didTapFollowUnFollowButton(model: UserNotification)
}

class NotificationFollowEventTableViewCell: UITableViewCell {

    static let identifier = "NotificationFollowsEventTableViewCell"
    weak var delegate: NotificationFollowEventTableViewCellDelegate?
    private var model: UserNotification?
    
    private let profileImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let label: UILabel = {
       
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "@kannyWest started following you"
        
        return label
    }()
    
    private let followButton: UIButton = {
       
        let button = UIButton()
        
        
        return button
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(followButton)
        followButton.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
    }
    
    @objc private func didTapFollowButton() {
        
        guard let model = model else {
            return
        }
        
        delegate?.didTapFollowUnFollowButton(model: model)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // photo text postButton
        
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height-6, height: contentView.height-6)
        profileImageView.layer.cornerRadius = profileImageView.height/2
        
        let size = contentView.height - 4
        followButton.frame = CGRect(x: contentView.width - size - 5, y: 2, width: size, height: size)
        
        label.frame = CGRect(x: profileImageView.right + 5, y: 0, width: contentView.width - size - profileImageView.width - 16, height: contentView.height)
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        label.text = nil
        
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
        
    }
    
    public func configure(with model: UserNotification) {
        
        self.model = model
        
        switch model.type {
            
        case .like(_):
            break
        case .follow:
            // configue button
            break
        }
        
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
