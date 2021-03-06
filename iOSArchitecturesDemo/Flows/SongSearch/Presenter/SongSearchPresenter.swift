//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SongSearchViewInput: class {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func hideNoResults()
    func showNoResults()
    func throbber(show: Bool)
}

protocol SongSearchViewOutput {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ song: ITunesSong)
    func viewDidMoveToAppsSearch()
}

class SongSearchPresenter {
    
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    let interactor: SearchInteractorInput
    let router: SearchRouterProtocol
    
    init(interactor: SearchInteractorInput, router: SearchRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func requestSong(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
    private func openAppDetail(with song: ITunesSong) {
        self.router.openDetails(for: song)
    }
}

extension SongSearchPresenter: SongSearchViewOutput {
    func viewDidMoveToAppsSearch() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.appStartManager?.startSearchByApps()
        }
    }
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        requestSong(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        openAppDetail(with: song)
    }
    
    
}
