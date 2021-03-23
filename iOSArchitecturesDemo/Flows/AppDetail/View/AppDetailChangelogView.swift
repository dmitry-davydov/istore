//
//  AppDetailChangelogView.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailChangelogView: UIView {
    private(set) lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        label.text = "Что нового"
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var releasedAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.textAlignment = .right
        
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .clear
        addSubview(headerLabel)
        addSubview(versionLabel)
        addSubview(releasedAtLabel)
        addSubview(descriptionLabel)
        
        let halfScreenWidthWithoutPaddings = ceil((UIScreen.main.bounds.width - (16 * 2)) / 2)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            headerLabel.leftAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            versionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            versionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            versionLabel.widthAnchor.constraint(equalToConstant: halfScreenWidthWithoutPaddings),
            
            releasedAtLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            releasedAtLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            releasedAtLabel.widthAnchor.constraint(equalToConstant: halfScreenWidthWithoutPaddings),
            
            descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 12),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }
}
