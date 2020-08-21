//
//  LoginViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        
        static let cornerRadius: CGFloat = 8.0
    }
    
    
    // Outletの作成
    private let usernameEmailTextField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username or Email....."
        
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        
        return UITextField()
    }()
    
    private let passwordField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "password....."
        
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        
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
        
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 200)
        
        
        
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
