//
//  SongDetailArtView.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailArtView: UIView {
    private(set) lazy var artImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.contentScaleFactor = 1
        
        return imageView
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16.0)
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
        addSubview(artImage)
        addSubview(artistNameLabel)
        addSubview(trackNameLabel)
        
        NSLayoutConstraint.activate([
            artImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            artImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            artImage.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            artImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            artistNameLabel.bottomAnchor.constraint(equalTo: artImage.bottomAnchor, constant: -8),
            artistNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            artistNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            trackNameLabel.topAnchor.constraint(equalTo: artImage.bottomAnchor, constant: 8),
            trackNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            trackNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }
}
