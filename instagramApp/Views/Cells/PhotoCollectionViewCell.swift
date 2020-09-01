//
//  PhotoCollectionViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/29.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let idntifier = "PhotoCollectionViewCell"
    
    private let photoImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // contentViewに画像をセットする
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemtnted")
    }
    
    public func configure(with model: String) {
        
        
    }
    
    public func configure(with: imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}

