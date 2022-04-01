//
//  Results.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//
import RealmSwift
import Realm
import Foundation

class Results : Object, Codable {
    @objc dynamic var  wrapperType : String?
    @objc dynamic var  kind : String?
    @objc dynamic var  artistId = 0
    @objc dynamic var  collectionId = 0
    @objc dynamic var  trackId = 0
    @objc dynamic var  artistName : String?
    @objc dynamic var  collectionName : String?
    @objc dynamic var  trackName : String?
    @objc dynamic var  collectionCensoredName : String?
    @objc dynamic var  trackCensoredName : String?
    @objc dynamic var  artistViewUrl : String?
    @objc dynamic var  collectionViewUrl : String?
    @objc dynamic var  trackViewUrl : String?
    @objc dynamic var  previewUrl : String?
    @objc dynamic var  artworkUrl30 : String?
    @objc dynamic var  artworkUrl60 : String?
    @objc dynamic var  artworkUrl100 : String?
    @objc dynamic var  releaseDate : String?
    @objc dynamic var  collectionExplicitness : String?
    @objc dynamic var  trackExplicitness : String?
    @objc dynamic var  country : String?
    @objc dynamic var  currency : String?
    @objc dynamic var  primaryGenreName : String?


    enum CodingKeys: String, CodingKey {

        case wrapperType = "wrapperType"
        case kind = "kind"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case trackId = "trackId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case trackName = "trackName"
        case collectionCensoredName = "collectionCensoredName"
        case trackCensoredName = "trackCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case trackViewUrl = "trackViewUrl"
        case previewUrl = "previewUrl"
        case artworkUrl30 = "artworkUrl30"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case releaseDate = "releaseDate"
        case collectionExplicitness = "collectionExplicitness"
        case trackExplicitness = "trackExplicitness"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"

    }
}
