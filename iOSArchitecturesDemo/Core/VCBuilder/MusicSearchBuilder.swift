//
//  MusicSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

class MusicSearchBuilder {
    static func build() -> (UIViewController & SongSearchViewInput) {
        let interactor = SearchInteractor()
        let router = SearchSongRouter()
        let presenter = SongSearchPresenter(interactor: interactor, router: router)
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.vc = viewController
        
        return viewController
    }
}
