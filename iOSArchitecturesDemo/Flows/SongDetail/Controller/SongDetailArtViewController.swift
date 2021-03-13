//
//  SongDetailArtViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailArtViewController: UIViewController {
    private let song: ITunesSong
    
    private let imageDownloader = ImageDownloader()
    
    private var artView: SongDetailArtView {
        return self.view as! SongDetailArtView
    }
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SongDetailArtView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        downloadImage()
        artView.artistNameLabel.text = song.artistName
        artView.trackNameLabel.text = song.trackName
    }
    
    private func downloadImage() {
        guard let url = self.song.artwork else { return }
        
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, error) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.artView.artImage.image = image
            }
        }
    }
    
    
}
