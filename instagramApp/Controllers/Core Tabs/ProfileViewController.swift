//
//  ExploreViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // collectionViewの設定
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        
        collectionView = UICollectionView()
        
    }
    
    private func configureNavigationBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingButton))
        
    }
    
    @objc private func didTapSettingButton() {
        
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    



}
