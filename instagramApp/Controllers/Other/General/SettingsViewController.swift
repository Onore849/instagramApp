//
//  SettingsViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import SafariServices

struct SettingCellModel {
    
    let title: String
    // ??
    let handler: (() -> Void)
    
}

/// ViewController to show user settings
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
     
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
        
    }()
    
    private var data = [ [SettingCellModel] ]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    private func configureModels() {
        
        data.append([
            
            SettingCellModel(title: "Edit Profile") { [ weak self ] in
                
                self?.didTapEditProfile()
                
            },
            
            SettingCellModel(title: "Invite Friends") { [ weak self ] in
                
                self?.didTapInviteFriends()
                
            },
            
            SettingCellModel(title: "Save Original Posts") { [ weak self ] in
                
                self?.didTapSaveOriginalPosts()
                
            }
        ])
        
        data.append([
            
            SettingCellModel(title: "Terms of Service") { [ weak self ] in
                
                self?.openURL(type: .terms)
                
            },
            
            SettingCellModel(title: "Privacy Policy") { [ weak self ] in
                
                self?.openURL(type: .privacy)
                
            },
            
            SettingCellModel(title: "Help / Feedback") { [ weak self ] in
                
                self?.openURL(type: .help)
                
            },
        ])
        
        data.append([
            
            SettingCellModel(title: "Log Out") { [ weak self ] in
                
                self?.didTapLogOut()
                
            }
        ])
        
    }
    
    private func didTapEditProfile() {
        
        let vc = EditProfileViewController()
        vc.title = "edit profile"
        let navVC = UINavigationController(rootViewController: vc)
        
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true)
        
        
    }
    
    private func didTapInviteFriends() {
        // show share sheet to invite friends
        
    }
    
    private func didTapSaveOriginalPosts() {
        
    }
    
    enum SettingsURLType {
        
        case terms, privacy, help
        
    }
    
    private func openURL(type: SettingsURLType) {
        
        let urlString: String
        
        switch type {
        case .terms:
            urlString = "https://help.instagram.com/581066165581870"
        case .privacy:
            urlString = "https://help.instagram.com/196883487377501/?hel-"
        case .help:
            urlString = "https://help.instagram.com/"
            
        }
        
        // urlstringをキャストした時にoptional型になっている
        guard let url = URL(string: urlString) else {
            
            return
            
        }
        
        // optional型だと引数に取れない
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
//    private func didTapTermsOfServices() {
//
//
//    }
    
//    private func didTap
    
    // logoutする処理を記述
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            
            AuthManager.shared.logOut( completion: { ( success ) in
                
                DispatchQueue.main.async {
                    
                    if success {
                        // present log in
                        
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            
                            self.navigationController?.popViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                            
                        }
                        
                    }
                    else {
                        // error occured
                        // ??
                        fatalError("Could not log out user")
   
                    }
                }
            })
            
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
    
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return data.count
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Handle cell selection
        data[indexPath.section][indexPath.row].handler()
        
    }
    
    
    
    
}
