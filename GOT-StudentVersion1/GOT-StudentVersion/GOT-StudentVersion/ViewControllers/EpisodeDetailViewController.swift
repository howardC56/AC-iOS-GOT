//
//  EpisodeDetailViewController.swift
//  GOT-StudentVersion
//
//  Created by Howard Chang on 11/8/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

final class EpisodeDetailViewController: UIViewController {
    
    let picture = UIImageView()
    let episodeName = UILabel()
    let airDate = UILabel()
    let seasonNumber = UILabel()
    let episodeNumber = UILabel()
    let runTime = UILabel()
    let summary = UILabel()
    var selectedEpisode: GOTEpisode!
    
    
    private func labelInfo() {
        picture.image = UIImage(named: selectedEpisode.originalImageID)
        episodeName.text = selectedEpisode.name
        airDate.text = "Air Date: \(selectedEpisode.airdate)"
        seasonNumber.text = "Season: \(String(selectedEpisode.season))"
        episodeNumber.text = "Episode: \(String(selectedEpisode.number)) "
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
        airDateConstraints()
        summaryConstraints()
        labelInfo()
    }
    
    private func configurePicture() {
        picture.clipsToBounds = true
        view.addSubview(picture)
    }
    
    private func addSubViews() {
        view.addSubview(episodeName)
        view.addSubview(seasonNumber)
        view.addSubview(episodeNumber)
        view.addSubview(runTime)
        view.addSubview(airDate)
        view.addSubview(summary)
    }
    
    private func pictureConstraints() {
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ).isActive = true
        picture.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picture.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 300).isActive = true
        picture.widthAnchor.constraint(equalTo: picture.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func episodeNameConstraints() {
        episodeName.numberOfLines = 0
        episodeName.adjustsFontSizeToFitWidth = true
        episodeName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        episodeName.topAnchor.constraint(equalTo: picture.bottomAnchor),
        episodeName.leadingAnchor.constraint(equalTo: picture.leadingAnchor),
        episodeName.heightAnchor.constraint(equalToConstant: 30),
        episodeName.trailingAnchor.constraint(equalTo: picture.trailingAnchor)
        ])
        episodeName.textAlignment = .center
    }
    
    private func seasonNumberConstraints() {
        seasonNumber.numberOfLines = 0
        seasonNumber.adjustsFontSizeToFitWidth = true
        seasonNumber.translatesAutoresizingMaskIntoConstraints = false
        seasonNumber.topAnchor.constraint(equalTo: episodeName.bottomAnchor, constant: 15).isActive = true
        seasonNumber.leadingAnchor.constraint(equalTo: episodeName.leadingAnchor, constant: 15).isActive = true
        seasonNumber.trailingAnchor.constraint(equalTo: episodeName.trailingAnchor).isActive = true
        seasonNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func episodeNumberConstraints() {
        episodeNumber.numberOfLines = 0
        episodeNumber.adjustsFontSizeToFitWidth = true
        episodeNumber.translatesAutoresizingMaskIntoConstraints = false
        episodeNumber.topAnchor.constraint(equalTo: seasonNumber.bottomAnchor, constant: 15).isActive = true
        episodeNumber.leadingAnchor.constraint(equalTo: seasonNumber.leadingAnchor).isActive = true
        episodeNumber.heightAnchor.constraint(equalToConstant: 30).isActive = true
        episodeNumber.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor).isActive = true
    }
    
    private func runTimeConstraints() {
        runTime.numberOfLines = 0
        runTime.adjustsFontSizeToFitWidth = true
        runTime.translatesAutoresizingMaskIntoConstraints = false
        runTime.topAnchor.constraint(equalTo: episodeNumber.bottomAnchor, constant: 15).isActive = true
        runTime.leadingAnchor.constraint(equalTo: episodeNumber.leadingAnchor).isActive = true
        runTime.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor).isActive = true
        runTime.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func airDateConstraints() {
        airDate.numberOfLines = 0
        airDate.adjustsFontSizeToFitWidth = true
        airDate.translatesAutoresizingMaskIntoConstraints = false
        airDate.topAnchor.constraint(equalTo: runTime.bottomAnchor, constant: 15).isActive = true
        airDate.leadingAnchor.constraint(equalTo: runTime.leadingAnchor).isActive = true
        airDate.trailingAnchor.constraint(equalTo: runTime.trailingAnchor).isActive = true
        airDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func summaryConstraints() {
        summary.numberOfLines = 0
        summary.adjustsFontSizeToFitWidth = true
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.topAnchor.constraint(equalTo: airDate.bottomAnchor, constant: 50).isActive = true
        summary.leadingAnchor.constraint(equalTo: episodeNumber.leadingAnchor, constant: 20).isActive = true
        summary.trailingAnchor.constraint(equalTo: seasonNumber.trailingAnchor, constant: -20).isActive = true
        summary.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
}
