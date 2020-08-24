//
//  ViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
//
//        do {
//
//            try Auth.auth().signOut()
//
//        }
//        catch {
//
//            print("failed to sign out")
//
//        }
    }
    
    
    // ログインしてなかったらログイン画面に遷移させる処理
    private func handleNotAuthenticated() {
        
        // check auth status
        if Auth.auth().currentUser == nil {
            
            // show log in
            let loginVC = LoginViewController()
            
            // 遷移した時の表示
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false)
        }
    
        
    }


}

