//
//  GroupDetailView.swift
//  findYourPeers
//
//  Created by Howard Chang on 4/20/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

final class GroupDetailView: UIView {
    
    public lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.text = "Title Here"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var categoryLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
           label.textColor = .black
           label.adjustsFontSizeToFitWidth = true
           label.text = "category Here"
           label.textAlignment = .center
           label.backgroundColor = .white
           label.numberOfLines = 0
           return label
       }()
    
     public lazy var descriptionLabel: UITextView = {
           let label = UITextView()
           label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
           label.textColor = .black
           label.textAlignment = .left
           label.layer.borderWidth = 1
           label.layer.borderColor = UIColor.black.cgColor
           label.text = "Date Posted: , UserName: , Description:"
           label.backgroundColor = .white
           label.sizeToFit()
           label.isEditable = false
           return label
       }()
    
    public lazy var tableView: UITableView = {
        let tableV = UITableView()
        tableV.rowHeight = 140
        tableV.backgroundColor = .white
        return tableV
    }()
    
    public lazy var commentBox: UITextField = {
       let comment = UITextField()
        comment.placeholder = "comment here"
        return comment
    }()
    
    public lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .blue
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: 25).cgPath
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 1.5
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        return button
    }()
    
    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        photoimageSetup()
        titleLabelSetup()
        categoryLabelSetup()
        descriptionLabelSetup()
        tableViewSetup()
        commentBoxSetup()
        buttonSetup()
    }
    
    private func photoimageSetup() {
    addSubview(photoImageView)
        photoImageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 15, width: 120, height: 120)
    }
    
    private func titleLabelSetup() {
        addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: photoImageView.rightAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 15)
    }
    
    private func categoryLabelSetup() {
        addSubview(categoryLabel)
        categoryLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, paddingTop: 10)
    }
    
    private func descriptionLabelSetup() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: categoryLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, height: 50)
    }
    
    private func tableViewSetup() {
        addSubview(tableView)
        tableView.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 25)
    }
    
    private func commentBoxSetup() {
        addSubview(commentBox)
        commentBox.anchor(top: tableView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 15, paddingLeft: 30, paddingBottom: 30, width: bounds.width * 0.75)
    }
    
    private func buttonSetup() {
        addSubview(commentButton)
        commentButton.anchor(top: commentBox.topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 30, width: 60, height: 60)
    }
}
