//
//  MyTunesListViewModel.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//

import Foundation
import RxSwift
import XCoordinator
import Action

protocol MyTunesListViewModelInput {
    
  //var selectedTune: AnyObserver<Results> { get }
}
protocol MyTunesListViewModelOutput {
    var myTunesListResponse: PublishSubject<MyTunesListResponse> { get }
    var myTunesList: PublishSubject<[Results]> { get }
    
}
protocol MyTunesListViewModelStoredProperties {
    var myTunesListUseCase : MyTunesListUseCase { get }
    
}

protocol MyTunesListViewModel {
    var input: MyTunesListViewModelInput { get }
    var output: MyTunesListViewModelOutput { get }
    var storedProperties : MyTunesListViewModelStoredProperties { get }
    func fetchMyTunesList(params: [String:Any])
}

extension MyTunesListViewModel where Self: MyTunesListViewModelInput & MyTunesListViewModelOutput & MyTunesListViewModelStoredProperties {
    var input: MyTunesListViewModelInput { return self }
    var output: MyTunesListViewModelOutput { return self }
    var storedProperties: MyTunesListViewModelStoredProperties { return self }
}
