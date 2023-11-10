//
//  MusicRepository.swift
//  MusicPlayer
//
//  Created by Sahil Ramteke on 10/11/23.
//

import Foundation

enum RepoResult {
    case success([Track])
    case failure(Error)
}

protocol MusicRepository {
    func fetchList(with url: URL, completion: @escaping (RepoResult) -> Void)
}

class MusicRepositoryImpl: MusicRepository {
    func fetchList(with url: URL, completion: @escaping (RepoResult) -> Void) {
        fetch(with: url) { result in
            switch result {
            case .success(let data, _):
                do {
                    let decoder = JSONDecoder()
                    let tracks = try decoder.decode([Track].self , from: data)
                    completion(.success(tracks))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
    
extension MusicRepositoryImpl {
    enum HTTPResult {
        case success(Data, HTTPURLResponse?)
        case failure(Error)
    }

    private func fetch(with url: URL, completion: @escaping (HTTPResult) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data, let response {
                completion(.success(data, response as? HTTPURLResponse))
            }
        }.resume()
    }
}
