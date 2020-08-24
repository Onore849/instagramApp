//
//  Extensions.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

// よく使う処理をまとめておく
extension UIView {
    
    // MARK:- CGRectの値を簡素に
    public var width: CGFloat {
        
        return frame.size.width
    }
    
    public var height: CGFloat {
        
        return frame.size.height
    }
    
    public var top: CGFloat {
        
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        
        return top + frame.size.height
    }
    
    public var left: CGFloat {
        
        return frame.origin.x
    }
    
    public var right: CGFloat {
        
        return left + frame.size.width
    }
    
}


extension String {
    
    func safeDatabaseKey() -> String {

        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        
    }
    
    
}
