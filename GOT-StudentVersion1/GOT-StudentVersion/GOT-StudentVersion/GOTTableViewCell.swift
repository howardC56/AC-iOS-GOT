//
//  GOTTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Howard Chang on 11/7/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

class GOTTableViewCell: UITableViewCell {
    
    var name = UILabel()
    var episode = UILabel()
    var picture = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(name)
        configureEpisode()
        name.configureLabel(name)
        configurePicture()
        setImageConstraints()
        setNameConstraints()
        setEpisodeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePicture() {
        picture.clipsToBounds = true
        picture.layer.cornerRadius = 10
        addSubview(picture)
    }
    
    func configureEpisode() {
        episode.numberOfLines = 0
        episode.adjustsFontSizeToFitWidth = true
        addSubview(episode)
    }
    
    
    func setImageConstraints() {
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.heightAnchor.constraint(equalToConstant: 80).isActive = true
        picture.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        picture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        picture.widthAnchor.constraint(equalTo: picture.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setNameConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 20).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        name.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    }
    
    func setEpisodeConstraints() {
        episode.translatesAutoresizingMaskIntoConstraints = false
        episode.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 20).isActive = true
        episode.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        episode.heightAnchor.constraint(equalToConstant: 30).isActive = true
        episode.topAnchor.constraint(equalTo: name.bottomAnchor, constant: -10).isActive = true
    }
    
    func configureCell(_ episodes: GOTEpisode) {
        picture.image = UIImage(named: episodes.originalImageID)
        name.text = episodes.name
        episode.text = "S: \(episodes.season) E: \(episodes.number)"
    }
}
