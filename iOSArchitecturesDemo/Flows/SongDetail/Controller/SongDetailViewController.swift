//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    var song: ITunesSong
    
    // Сабвьюконтроллер для отображения картинки альбома, артиста и названия альбома
    lazy var artDetailViewController = SongDetailArtViewController(song: song)
    
    // сабвьюконтроллер для отображения цены за альбом
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.configureNavigationController()
        
        addArtViewController()
    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addArtViewController() {
        
        view.addSubview(artDetailViewController.view)
        addChild(artDetailViewController)
        
        artDetailViewController.didMove(toParent: self)
        
        artDetailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            artDetailViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            artDetailViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            artDetailViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
    }
    
}
