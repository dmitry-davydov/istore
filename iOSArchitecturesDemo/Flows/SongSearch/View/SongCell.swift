//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
 
    // MARK: - Subviews
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.artistLabel.text = cellModel.artist
        self.trackNameLabel.text = cellModel.trackName
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.artistLabel, self.trackNameLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addArtistLabel()
        self.addTrackNameLabel()
    }
    
    private func addArtistLabel() {
        self.contentView.addSubview(self.artistLabel)
        NSLayoutConstraint.activate([
            self.artistLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artistLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }
    
    private func addTrackNameLabel() {
        self.contentView.addSubview(self.trackNameLabel)
        NSLayoutConstraint.activate([
            self.trackNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }
}
