//
//  MyTunesDetailsViewModel.swift
//  MyTunesMVVM
//
//  Created by MacOS on 31.03.2022.
//

import Foundation
import RxSwift
import XCoordinator
import Action

protocol MyTunesDetailsViewModelInput {
}

protocol MyTunesDetailsViewModelOutput {
    var wrapperType   :  BehaviorSubject<String> { get }
    var kind : BehaviorSubject<String> { get }
    var artworkUrl100 : BehaviorSubject<String> { get }
    var primaryGenreName : BehaviorSubject<String> { get }
    var trackName : BehaviorSubject<String> { get }
    var country : BehaviorSubject<String> { get }
}

protocol MyTunesDetailsViewModel {
    var input: MyTunesDetailsViewModelInput { get }
    var output: MyTunesDetailsViewModelOutput { get }
}

extension MyTunesDetailsViewModel where Self: MyTunesDetailsViewModelInput & MyTunesDetailsViewModelOutput {
    var input: MyTunesDetailsViewModelInput { return self }
    var output: MyTunesDetailsViewModelOutput { return self }
}
