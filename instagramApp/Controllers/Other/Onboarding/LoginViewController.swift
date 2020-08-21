//
//  LoginViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Outletの作成
    private let usernameEmailTextField: UITextField = {
        
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        
        let field = UITextField()
        
        field.isSecureTextEntry = true
        
        
        return field
    }()
    
    private let loginButton: UIButton = {
        
        return UIButton()
    }()
    
    private let termsButton: UIButton = {
        
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        
        return UIButton()
    }()
    
    private let didTapCreatedButton: UIButton = {
        
        return UIButton()
    }()
    
    private let headerView: UIView = {
        
        return UIView()
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        // cmd + shift + a でダークモード、通常モードの切替
        view.backgroundColor = .systemBackground

    }
    
    // 作ったパーツのレイアウトを作成する
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        
        
        
    }
    
    
    // まとめて追加する
    private func addSubviews() {
        
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
        
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapTermsButton() {}
    
    @objc private func didTapPrivacyButton() {}
    
    @objc private func didTapTapCreateAccountButton() {}
    
    



}
