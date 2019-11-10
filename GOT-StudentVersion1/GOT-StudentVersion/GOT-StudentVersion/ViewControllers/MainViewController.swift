//
//  MainViewController.swift
//  GOT-StudentVersion
//
//  Created by Howard Chang on 11/6/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    var tableView = UITableView()
    var sortedEpisodes = GOTEpisode.sortedEpisodes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Game Of Thrones"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.anchor(view)
        tableView.register(GOTTableViewCell.self, forCellReuseIdentifier: "GOTTableViewCell")
        tableView.register(GOTTableViewCellTypeTwo.self, forCellReuseIdentifier: "GOTTableViewCellTypeTwo")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedEpisodes[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sortedEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = sortedEpisodes[indexPath.section][indexPath.row]
        if indexPath.section % 2 == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCell") as? GOTTableViewCell {
                cell.configureCell(episode)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCellTypeTwo") as? GOTTableViewCellTypeTwo {
                cell.configureCell(episode)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1) "
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEpisode = sortedEpisodes[indexPath.section][indexPath.row]
        let viewController = EpisodeDetailViewController()
        viewController.selectedEpisode = selectedEpisode
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}
