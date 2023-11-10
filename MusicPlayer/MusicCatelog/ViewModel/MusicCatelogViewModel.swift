//
//  MusicCatelogViewModel.swift
//  MusicPlayer
//
//  Created by Sahil Ramteke on 10/11/23.
//

import Foundation

typealias MusicCatelogViewModelStateObserver = (MusicCatelogViewModelState) -> Void

enum MusicCatelogViewModelState {
    case data([TrackViewModel])
}

protocol MusicCatelogViewModel {
    func loadMusicCatalog()
    func stateObserver(observer: @escaping MusicCatelogViewModelStateObserver)
}

class MusicCatelogViewModelImpl: MusicCatelogViewModel {
    private let repository: MusicRepository
    private var observer: MusicCatelogViewModelStateObserver?

    init(repo: MusicRepository) {
        repository = repo
    }
    
    func loadMusicCatalog() {
        let mockURL = URL(string: "https://www.jsonkeeper.com/b/PWUB")!
        repository.fetchList(with: mockURL) { [weak self] result in
            switch result {
            case .success(let tracks):
                let viewModels = tracks.map {
                    TrackViewModel(title: $0.title, artist: $0.artist, album: $0.album, url: $0.url)
                }
                self?.observer?(.data(viewModels))

            case .failure(_):
                break
            }
        }
    }
    
    func stateObserver(observer: @escaping MusicCatelogViewModelStateObserver) {
        self.observer = observer
    }
}
