//
//  RegisterationViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class RegisterationViewController: UIViewController {
    
    struct Constants {
        
        static let cornerRadius: CGFloat = 8.0
    }

    // textFieldの記述
    private let usernameField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Username"
        
        field.returnKeyType = .next
        
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        field.backgroundColor = .secondarySystemBackground
        
        return field
    }()
    
    // textFieldの記述
    private let emailField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "Email Adress....."
        
        field.returnKeyType = .next
        
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        field.backgroundColor = .secondarySystemBackground
        
        return field
    }()
    
    
    
    
    private let passwordField: UITextField = {
        
        let field = UITextField()
        field.placeholder = "password....."
        
        field.returnKeyType = .continue
        
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        
        
        return field
    }()
    
    // buttonの記述
    private let registerButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Sign Up", for: .normal)
        
        button.layer.masksToBounds = true
        
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.addTarget(self,
                                 action: #selector(didTapRegister),
                                 for: .touchUpInside)
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)

        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 10, width: view.width-40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10, width: view.width-40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width-40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom + 10, width: view.width-40, height: 52)
        
    }
    
    // MARK:- buttonタップ時に持たせたい機能
    
    @objc private func didTapRegister() {
        
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
            let username = usernameField.text, !username.isEmpty,
            let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
                
                return
                
        }
        
        
        
    }


}

// キーボードの処理
extension RegisterationViewController: UITextFieldDelegate {
    
    // returnキーが押されたら実行する
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameField {
            
            // 自動的にemailFieldでキーボードが開く
            emailField.becomeFirstResponder()
            
        }
        else if textField == emailField {
            
            passwordField.becomeFirstResponder()
            
        }
        else {
            
            didTapRegister()
        }
        
        return true
        
    }
    
    
}
