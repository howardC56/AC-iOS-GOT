//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Howard Chang on 11/8/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    let picture = UIImageView()
    let episodeName = UILabel()
    let airDate = UILabel()
    let seasonNumber = UILabel()
    let episodeNumber = UILabel()
    let runTime = UILabel()
    let summary = UILabel()
    var selectedEpisode: GOTEpisode!
    
    
    func labelInfo() {
        picture.image = UIImage(named: selectedEpisode.originalImageID)
        episodeName.text = "Episode: \(selectedEpisode.name)"
        airDate.text = "Air Date: \(selectedEpisode.airdate)"
        seasonNumber.text = "Season: \(String(selectedEpisode.season))"
        episodeName.text = String(selectedEpisode.number)
        runTime.text = "Run Time: \(String(selectedEpisode.runtime))"
        summary.text = selectedEpisode.summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        configurePicture()
        pictureConstraints()
        seasonNumberConstraints()
        episodeNameConstraints()
        episodeNumberConstraints()
        runTimeConstraints()
        summaryConstraints()
        labelInfo()
        }
    
    func configurePicture() {
        picture.clipsToBounds = true
        picture.layer.cornerRadius = 10
        view.addSubview(picture)
    }
    
    func addSubViews() {
        view.addSubview(episodeName)
        view.addSubview(airDate)
        view.addSubview(seasonNumber)
        view.addSubview(episodeNumber)
        view.addSubview(runTime)
        view.addSubview(summary)
    }
    
    func pictureConstraints() {
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor , constant: 0).isActive = true
        picture.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        picture.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 300).isActive = true
        picture.widthAnchor.constraint(equalTo: picture.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func episodeNameConstraints() {
        episodeName.numberOfLines = 0
        episodeName.adjustsFontSizeToFitWidth = true
        episodeName.translatesAutoresizingMaskIntoConstraints = false
        episodeName.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 15).isActive = true
        episodeName.leadingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 0).isActive = true
        episodeName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        episodeName.trailingAnchor.constraint(equalTo: picture.trailingAnchor).isActive = true
        episodeName.textAlignment = .center
    }
    
    func seasonNumberConstraints() {
        seasonNumber.numberOfLines = 0
        seasonNumber.adjustsFontSizeToFitWidth = true
        seasonNumber.translatesAutoresizingMaskIntoConstraints = false
        seasonNumber.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 15).isActive = true
        seasonNumber.leadingAnchor.constraint(equalTo: episodeName.leadingAnchor).isActive = true
        seasonNumber.trailingAnchor.constraint(equalTo: episodeName.trailingAnchor).isActive = true
        seasonNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func episodeNumberConstraints() {
        episodeNumber.numberOfLines = 0
        episodeNumber.adjustsFontSizeToFitWidth = true
        episodeNumber.translatesAutoresizingMaskIntoConstraints = false
        episodeNumber.topAnchor.constraint(equalTo: seasonNumber.bottomAnchor, constant: 15).isActive = true
        episodeNumber.leadingAnchor.constraint(equalTo: seasonNumber.leadingAnchor, constant: 15).isActive = true
        episodeNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
        episodeNumber.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor).isActive = true
    }
    
    func runTimeConstraints() {
        runTime.numberOfLines = 0
        runTime.adjustsFontSizeToFitWidth = true
        runTime.translatesAutoresizingMaskIntoConstraints = false
        runTime.topAnchor.constraint(equalTo: episodeNumber.bottomAnchor, constant: 15).isActive = true
        runTime.leadingAnchor.constraint(equalTo: episodeNumber.leadingAnchor, constant: 15).isActive = true
        runTime.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor).isActive = true
        runTime.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func airDateConstraints() {
        airDate.numberOfLines = 0
        airDate.adjustsFontSizeToFitWidth = true
        airDate.translatesAutoresizingMaskIntoConstraints = false
        airDate.topAnchor.constraint(equalTo: runTime.bottomAnchor, constant: 15).isActive = true
        airDate.leadingAnchor.constraint(equalTo: episodeNumber.leadingAnchor, constant: 15).isActive = true
        airDate.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor).isActive = true
        airDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func summaryConstraints() {
        summary.numberOfLines = 0
        summary.adjustsFontSizeToFitWidth = true
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.topAnchor.constraint(equalTo: runTime.bottomAnchor, constant: 100).isActive = true
        summary.leadingAnchor.constraint(equalTo: episodeNumber.leadingAnchor, constant: 20).isActive = true
        summary.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor, constant: 20).isActive = true
        summary.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    }

}
