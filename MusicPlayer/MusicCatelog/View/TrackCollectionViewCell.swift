//
//  TrackCollectionViewCell.swift
//  MusicPlayer
//
//  Created by Sahil Ramteke on 10/11/23.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()
    private let artistLabel = UILabel()
    private let albumLabel = UILabel()
    private let contentStack = UIStackView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setupView()
        setupConstraints()
    }
    
    func configureView(title: String, artist: String, album: String) {
        titleLabel.text = title
        artistLabel.text = artist
        albumLabel.text = album
    }
    
    private func setupView() {
        contentStack.axis = .vertical
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(artistLabel)
        contentStack.addArrangedSubview(albumLabel)
        
        addSubview(contentStack)
    }
    
    private func setupConstraints() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
