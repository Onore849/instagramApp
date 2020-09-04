//
//  NotificationLikeEventTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/09/03.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

protocol NotificationLikeEventTableViewCellDeleagate {
    
    func didTapRelatedPostButton(model: String)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    
    static let identfifier = "NotificationLikeEventCell"
    
    private let profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let label: UILabel = {
       
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
        
    }()
    
    private let postButton: UIButton = {
       
        let button = UIButton()
        
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.image = nil
        label.text = nil
        
        postButton.setBackgroundImage(nil, for: .normal)
    }
    
    private func configure(with model: String) {
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
