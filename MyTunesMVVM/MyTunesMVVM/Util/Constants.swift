//
//  Constants.swift
//  MyTunesMVVM
//
//  Created by MacOS on 31.03.2022.
//

import Foundation


enum Media: String {
    case media = "media"
    case movie = "movie"
    case podcast = "podcast"
    case music = "music"
    case musicVideo = "musicVideo"
    case audiobook = "audiobook"
    case shortFilm = "shortFilm"
    case tvShow = "tvShow"
    case software = "software"
    case ebook = "ebook"
    case all = "all"
}

enum WrapperType: String {
    case track = "track"
    case artist = "artist"
    case collection = "collection"
}

enum Entity: String {
    case entity = "entity"
    case musicVideo = "musicVideo"
    case podcast = "podcast"
    case allArtist = "allArtist"
    case album = "album"
    case mix = "mix"
    case audiobook = "audiobook"
    case tvSeason = "tvSeason"
    case allTrack = "allTrack"
}
