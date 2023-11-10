//
//  Track.swift
//  MusicPlayer
//
//  Created by Sahil Ramteke on 10/11/23.
//

import Foundation

struct Track: Decodable {
    let title: String
    let artist: String
    let album: String
    let url: String
}
