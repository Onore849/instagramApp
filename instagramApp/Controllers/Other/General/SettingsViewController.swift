//
//  SettingsViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

struct SettingCellModel {
    
    let title: String
    // ??
    let handler: (() -> Void)
    
}

/// ViewController to show user settings
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
       
        // ??
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        return tableView
        
    }()
    
    private var data = [
        [SettingCellModel]
        ]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureModels()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    private func configureModels() {
        
        let section = [
            
            SettingCellModel(title: "Log Out") { [ weak self ] in
                
                self?.didTapLogOut()
                
            }
        ]
        
        data.append(section)
        
    }
    
    // logoutする処理を記述
    private func didTapLogOut() {
        
        
        
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
        
//        cell.te
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Handle cell selection
        
        
    }
    
    
    
    
}
