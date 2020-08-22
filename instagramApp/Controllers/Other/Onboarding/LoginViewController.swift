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
    
    // textFieldの記述
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
        
        field.backgroundColor = .secondarySystemBackground
        
        return field
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
        field.backgroundColor = .secondarySystemBackground
        
        
        return field
    }()
    
    
    // buttonの記述
    private let loginButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Log In", for: .normal)
        
        button.layer.masksToBounds = true
        
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return button
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
    
    private let createAccountButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        
        return button
    }()
    
    // headerViewの作成
    private let headerView: UIView = {
        
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        
        return header
    }()

    
    // 表示部分
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // deleagteメソッドを呼ぶ
        usernameEmailTextField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        
        // cmd + shift + a でダークモード、通常モードの切替
        view.backgroundColor = .systemBackground

    }
    
    // 作ったパーツのレイアウトを作成する
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        
        headerView.frame = CGRect(
            x: 0,
            // safeAreaより下にしたい場合はy: view.safeAreaInsets.top,
            y: 0.0,
            width: view.width,
            height: view.height/3.0
        )
        
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10,
            width: view.width - 50,
            height: 52

        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52

        )
        
        createAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52

        )

        
        
        // headerViewの細かい設定
        configuareHeaderView()
        
        
    }
    
    private func configuareHeaderView() {
        
        guard headerView.subviews.count == 1 else {

            return
        }

        guard let backgroundView = headerView.subviews.first else {

            return
        }
        
        backgroundView.frame = headerView.bounds
        
        // add instagram logo
        let imageView = UIImageView(image: UIImage(named: "logo3"))
        headerView.addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2,
                                 height: headerView.height - view.safeAreaInsets.top)
        
        
    }
    
    
    // まとめて追加する
    private func addSubviews() {
        
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        
    }
    
    @objc private func didTapLoginButton() {}
    
    @objc private func didTapTermsButton() {}
    
    @objc private func didTapPrivacyButton() {}
    
    @objc private func didTapTapCreateAccountButton() {}
    
    



}
