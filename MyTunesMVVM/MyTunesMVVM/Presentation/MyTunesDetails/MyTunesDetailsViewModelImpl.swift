//
//  MyTunesDetailsViewModelImpl.swift
//  MyTunesMVVM
//
//  Created by MacOS on 31.03.2022.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action

class MyTunesDetailViewModelImpl: MyTunesDetailsViewModel, MyTunesDetailsViewModelInput, MyTunesDetailsViewModelOutput {
  
    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-
    
    
    // MARK: -Actions-
    

    
    // MARK: -Outputs-
   
 
    
    var wrapperType   =  BehaviorSubject<String> (value: "")
    var kind =   BehaviorSubject<String> (value: "")
    var artworkUrl100 =   BehaviorSubject<String> (value: "")
    var primaryGenreName  =   BehaviorSubject<String> (value: "")
    var trackName =  BehaviorSubject<String> (value: "")
    var country =   BehaviorSubject<String> (value: "")
   
    
    // MARK: -Stored properties-
    
    private let router: UnownedRouter<MyTunesListRoute>
    private let tune: Results
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<MyTunesListRoute>, tune: Results) {
        self.router = router
        self.tune = tune
        setTuneDetail()
    }
    
    func setTuneDetail() {
        wrapperType.onNext(tune.wrapperType ?? "")
        kind.onNext(tune.kind ?? "")
        artworkUrl100.onNext(tune.artworkUrl100 ?? "")
        primaryGenreName.onNext(tune.primaryGenreName ?? "")
        trackName.onNext(tune.trackName ?? "")
        country.onNext(tune.country ?? "")
       
    }
}
