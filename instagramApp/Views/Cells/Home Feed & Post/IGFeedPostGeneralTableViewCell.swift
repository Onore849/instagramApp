//
//  IGFeedPostGeneralTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/27.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

/// Comments
class IGFeedPostGeneralTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostGeneralTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemPink
    }
    
    // customCellの細かい設定
    public func configure() {
        
        // confiogure cell
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
