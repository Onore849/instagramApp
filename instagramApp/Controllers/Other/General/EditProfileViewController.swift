//
//  EditProfileViewController.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/21.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

struct EditProfileFormModel {
    
    let label: String
    let placeholder: String
    var value: String?
    
}

final class EditProfileViewController: UIViewController {
    
    private let tableView: UITableView = {
       
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        
        return tableView
        
    }()
    
    private var models = [[EditProfileFormModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = creatTableHeaderView()
        
        configureModels()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))

    }
    
    private func configureModels() {
        
        // name, username, website, bio
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        
        for label in section1Labels {
            
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)....", value: nil)
            
            section1.append(model)
        }
        models.append(section1)
        
        // email, phone, gender
        let section2Labels = ["Email", "phone", "gender"]
        var section2 = [EditProfileFormModel]()
        
        for label in section2Labels {
            
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)....", value: nil)
            
            section2.append(model)
            
        }
        models.append(section2)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    // MARK:- Action
    
    @objc private func didTapSave() {
        
        // Save info to database
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @objc private func didTapCancel() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func didTapChangeProfilePicture() {
        
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { ( _ ) in
            
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { ( _ ) in
            
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }

}

// MARK:- tableView

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource, FormTableViewCellDelegate {
    
    private func creatTableHeaderView() -> UIView {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        
        let size = header.height/1.5
        
        let profilePhotoButton = UIButton(frame: CGRect(x: (header.width - size)/2, y: (header.height - size)/2, width: size, height: size))
        
        header.addSubview(profilePhotoButton)
        
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.tintColor = .link
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        
        return header
        
    }
    
    @objc private func didTapProfilePhotoButton() {
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        
        cell.configure(with: model)
        cell.delegate = self
        
        cell.textLabel?.text = model.label
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard section == 1 else {
            
            return nil
            
        }
        
        return "Private Information"
    }
    
    
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updateModel: EditProfileFormModel?) {
        
        // update the model
        
        
    }
    
}
