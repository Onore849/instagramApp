//
//  FormTableViewCell.swift
//  instagramApp
//
//  Created by 野澤拓己 on 2020/08/29.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel?)
    
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let identifier = "FormTableViewCell"
    
    public weak var delegate: FormTableViewCellDelegate?
    
    private var model: EditProfileFormModel?
    
    private let formLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private let field: UITextField = {
        
        let field = UITextField()
        
        field.returnKeyType = .done
        
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        
        field.delegate = self
        
        // ??
        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: EditProfileFormModel) {
        
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
        
    }
    
    override func layoutSubviews() {
        
        // Assign frames
        formLabel.frame = CGRect(x: 20, y: 0, width: contentView.width/3, height: contentView.height)
        
        field.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width - 10 - formLabel.width, height: contentView.height)
    }
    
    // MARK:- Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        model?.value = textField.text
        guard let model = model else {
            return true
        }
        
        textField.resignFirstResponder()
        
        delegate?.formTableViewCell(self, didUpdateField: model)
        
        return true
        
    }
    

}
