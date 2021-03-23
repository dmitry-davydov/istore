//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let artist: String
    let trackName: String?
}

final class SongCellModelFactory {
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(artist: model.artistName ?? "", trackName: model.trackName)
    }
}
