//
//  Realm.swift
//  MyTunesMVVM
//
//  Created by MacOS on 1.04.2022.
//


import Foundation
import RealmSwift

class RealmHelper {
    
    private var   database:Realm
    static let   sharedInstance = RealmHelper()
    
    private init() {
        database = try! Realm()
    }
    
    func addCharacterToFavorites(tune: Results) {
        try! database.write {
            //database.add(characterDetails)
            database.create(Results.self, value: tune)
        }
    }
    
   // func fetchFavoriteList() -> Results<Results> {
   //     let object = database.objects(Results.self)
   //     return object
   // }
    
    static func getObjects<T:Results>(filter:String)->[T] {
           let realm = try! Realm()
           let realmResults = realm.objects(T.self).filter(filter)
           return Array(realmResults)

       }
    
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(tune: Results)   {
        try! database.write {
            database.delete(tune)
        }
    }
}


