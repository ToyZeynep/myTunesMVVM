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

        }
    }
}
