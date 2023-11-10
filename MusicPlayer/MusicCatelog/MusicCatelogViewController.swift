//
//  MusicCatelogViewController.swift
//  MusicPlayer
//
//  Created by Sahil Ramteke on 10/11/23.
//

import Foundation
import UIKit

class MusicCatelogViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var collectionDataSource: UICollectionViewDiffableDataSource<Int, TrackViewModel>!
    
    private let viewModel: MusicCatelogViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: MusicCatelogViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        setupCollectionView()
        setupDataSource()
        setupConstraints()
    }
    
    private func bindViewModel() {
        viewModel.stateObserver { state in
            switch state {
            case .data(_):
                break
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.delegate = self
    }
    
    private func setupDataSource() {
        let trackCellRegistration =  UICollectionView.CellRegistration<TrackCollectionViewCell, Int> { cell, indexPath, item in
        }

        collectionDataSource = UICollectionViewDiffableDataSource<Int, TrackViewModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: TrackViewModel) -> UICollectionViewCell? in
            return UICollectionViewCell()
        }
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize, subitems: [item])

        return UICollectionViewCompositionalLayout(
            section: NSCollectionLayoutSection(group: group))
    }
}

extension MusicCatelogViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // to-do
    }
}
