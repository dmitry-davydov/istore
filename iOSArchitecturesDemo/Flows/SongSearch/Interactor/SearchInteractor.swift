//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 14.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SearchInteractorInput {
    func requestApps(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

class SearchInteractor: SearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        searchService.getSongs(forQuery: query, completion: completion)
    }
}

