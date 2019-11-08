//
//  MainViewController.swift
//  GOT-StudentVersion
//
//  Created by Howard Chang on 11/6/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Game Of Thrones"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.anchor(view)
        tableView.register(GOTTableViewCell.self, forCellReuseIdentifier: "GOTTableViewCell")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1...5:
            return 10
        case 6:
            return 7
        default:
            return 0
    }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCell") as? GOTTableViewCell else { return UITableViewCell() }
        let episodes = GOTEpisode.allEpisodes[indexPath.row]
        cell.configureCell(episodes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1) "
    }
    
}
