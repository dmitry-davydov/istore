//
//  AppDetailChangelogViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Дима Давыдов on 13.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailChangelogViewController: UIViewController {
    private let app: ITunesApp
    
    private var appDetailChangelogView: AppDetailChangelogView {
        return self.view as! AppDetailChangelogView
    }
    
    init(app: ITunesApp) {
        self.app = app
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailChangelogView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        
        appDetailChangelogView.versionLabel.text = app.version
        if let releasedDate = app.currentVersionReleaseDate {
            appDetailChangelogView.releasedAtLabel.text = dateFormatter.string(from: releasedDate)
        }
        
        appDetailChangelogView.descriptionLabel.text = app.releaseNotes
    }
}
