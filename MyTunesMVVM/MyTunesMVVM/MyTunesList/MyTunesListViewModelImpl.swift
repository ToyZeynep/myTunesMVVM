//
//  MyTunesListViewModelImpl.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//


import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action

class MyTunesListViewModelImpl: MyTunesListViewModel, MyTunesListViewModelInput, MyTunesListViewModelOutput, MyTunesListViewModelStoredProperties {


    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-

    
    // MARK: -Actions-


    // MARK: -Outputs-
    var myTunesListResponse = PublishSubject<MyTunesListResponse>()
    var myTunesList = PublishSubject<[Results]>()
    
    // MARK: -Stored properties-
    
    private let router : UnownedRouter<MyTunesListRoute>
    var myTunesListUseCase = MyTunesListUseCase()
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<MyTunesListRoute> ) {
    self.router = router
        
    }
    
    func fetchMyTunesList(params: [String: Any]) {
        
        myTunesListUseCase.getMyTunesList(params: params).subscribe(onNext: { [weak self] response in
            guard let self = self else { return }
            if response.results != nil {
                self.myTunesListResponse.onNext(response)
            }else{
                print("error")
            }
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
    
    func navigateToFavorites()  {
//        router.trigger(.favoriteList)
    }
}
