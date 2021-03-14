//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterProtocol {
    func openDetails(for song: ITunesSong)
}

class SearchSongRouter: SearchRouterProtocol {
    weak var vc: UIViewController?
    
    func openDetails(for song: ITunesSong) {
        let songDetaillViewController = SongDetailViewController(song: song)
        vc?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
}
