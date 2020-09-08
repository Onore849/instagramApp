//
//  IGFeedPostTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/27.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation

// customCellを作成するClass
/// cell for primary post content
final class IGFeedPostTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostTableViewCell"
    
    private let postImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = nil
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var player: AVPlayer?
    private var playerLayer = AVPlayerLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }
    
    // customCellの細かい設定
    public func configure(with post: UserPost) {
        postImageView.image = UIImage(named: "test")
        
        
        return
        
        // confiogure cell
        switch post.postType {
        case .photo:
            // show photo
            postImageView.sd_setImage(with: post.postURL, completed: nil)
        case .video:
            // show video
            player = AVPlayer(url: post.postURL)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = contentView.bounds
        postImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImageView.image = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
