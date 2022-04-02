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
    case myTunesDetails(tune: Results)
    case favoriteList
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
            viewController.title = "List"
            return .push(viewController, animation: .default)
            
        case .myTunesDetails(let tune):
            let viewController = MyTunesDetailViewController()
            let viewModel = MyTunesDetailViewModelImpl(router: unownedRouter, tune: tune)
            viewController.bind(to: viewModel)
            viewController.title = "Details"
            return .push(viewController, animation: .default)
            
            
        case .favoriteList:
            let viewController = FavoriteListViewController()
            let viewModel = FavoriteListViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            viewController.title = "Favorites"
            return .push(viewController, animation: .default)
            
        case .pop :
            return .pop(animation: .default)
        }
    }
}
