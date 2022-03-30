//
//  MyTunesListCoordinator.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import XCoordinator

enum MyTunesListRoute: Route {
    
    case myTunesList
//    case myTunesDetails(tune: Results)
//    case favoriteList
    case pop
}

class MyTunesListCoordinator: NavigationCoordinator<MyTunesListRoute> {
    
    init() {
        super.init(initialRoute: .myTunesList)
    }
    
    override func prepareTransition(for route: MyTunesListRoute) -> NavigationTransition {
        switch route {
 
       case .myTunesList:
            let viewController = MyTunesListViewController()
            let viewModel = MyTunesListViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
        return .push(viewController, animation: .default)
     
 //     case .myTunesDetails(let tune):
 //           let viewController = CharacterDetailViewController()
 //           let viewModel = CharacterDetailViewModelImpl(router: unownedRouter, characterDetail: characterDetail)
 //           viewController.bind(to: viewModel)
 //           viewController.title = "Details"
 //           return .push(viewController, animation: .default)
 //
 //       case .favoriteList:
 //           let viewController = FavoritesListViewController()
 //           let viewModel = FavoriteListViewModelImpl(router: unownedRouter)
 //           viewController.bind(to: viewModel)
 //           viewController.title = "Favorites"
 //           return .push(viewController, animation: .default)
            
        case .pop :
            return .pop(animation: .default)
        }
    }
}
