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
        tableView.register(GOTTableViewCellTypeTwo.self, forCellReuseIdentifier: "GOTTableViewCellTypeTwo")
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
        var episodes = [GOTEpisode]()
        let cellType = indexPath.section + 1
        if cellType % 2 == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCell") as? GOTTableViewCell {
                for each in GOTEpisode.allEpisodes {
                    if each.season == cellType {
                        episodes.append(each)
                    }
                }
                let showEpisodes = episodes[indexPath.row]
                cell.configureCell(showEpisodes)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GOTTableViewCellTypeTwo") as? GOTTableViewCellTypeTwo {
                for each in GOTEpisode.allEpisodes {
                    if each.season == cellType {
                        episodes.append(each)
                    }
                }
                let showEpisodes = episodes[indexPath.row]
                cell.configureCell(showEpisodes)
                
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1) "
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEpisode = GOTEpisode.allEpisodes[indexPath.row]
        let viewController = EpisodeDetailViewController()
        viewController.selectedEpisode = selectedEpisode
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}
