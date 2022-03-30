//
//  MyTunesListUseCase.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol MyTunesListUseCaseType {
    
    func getMyTunesList(params: [String: Any]) -> Observable<MyTunesListResponse>
}

struct MyTunesListUseCase: MyTunesListUseCaseType {
    func getMyTunesList(params: [String : Any]) -> Observable<MyTunesListResponse> {
        return ApiClient.getMyTunesList(params: params)
    }

}
