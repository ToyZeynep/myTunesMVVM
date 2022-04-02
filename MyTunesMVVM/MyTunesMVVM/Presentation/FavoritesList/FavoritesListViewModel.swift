//
//  FavoritesListViewModel.swift
//  MyTunesMVVM
//
//  Created by MacOS on 1.04.2022.
//

import Foundation
import RxSwift
import XCoordinator
import Action
import RealmSwift

protocol FavoritesListViewModelInput {
    
    var selectedTune: AnyObserver<Results> { get }
}
protocol  FavoritesListViewModelOutput {

    var favoriteList: PublishSubject<[Results]> { get }
    
}
protocol  FavoritesListViewModelStoredProperties {
 
}

protocol  FavoritesListViewModel {
    var input: FavoritesListViewModelInput { get }
    var output: FavoritesListViewModelOutput { get }
    var storedProperties : FavoritesListViewModelStoredProperties { get }
    func fetchFavoriteList()
    func dismiss()
 
}

extension  FavoritesListViewModel where Self: FavoritesListViewModelInput & FavoritesListViewModelOutput & FavoritesListViewModelStoredProperties {
    var input: FavoritesListViewModelInput { return self }
    var output: FavoritesListViewModelOutput { return self }
    var storedProperties: FavoritesListViewModelStoredProperties { return self }
}
