//
//  FavoritesListViewModelImpl.swift
//  MyTunesMVVM
//
//  Created by MacOS on 1.04.2022.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action
import RealmSwift

class FavoriteListViewModelImpl: FavoritesListViewModel, FavoritesListViewModelInput, FavoritesListViewModelOutput, FavoritesListViewModelStoredProperties {
    
    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-
    
    private(set) lazy var selectedTune = selectedTuneActions.inputs
    
    // MARK: -Actions-
    
    lazy var selectedTuneActions = Action<Results, Void> { [unowned self] tune in
        self.router.rx.trigger(.myTunesDetails(tune: tune))
        }
    
    // MARK: -Outputs-
    var favoriteList = PublishSubject<[Results]>()
    
    // MARK: -Stored properties-
    private let router : UnownedRouter<MyTunesListRoute>
    
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<MyTunesListRoute> ) {
        self.router = router
        self.fetchFavoriteList()
    }

    func fetchFavoriteList() {
        DispatchQueue.main.async {
            let favoriteList = RealmHelper.sharedInstance.getObjects().map { $0 }
            var list:[Results] = [Results]()
            list.append(contentsOf: favoriteList)
            self.favoriteList.onNext(list)
        }
    }
    
    func dismiss() {
        router.trigger(.pop)
    }
}
