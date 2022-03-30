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
    
    func getCharacterList(params: [String: Any]) -> Observable<MyTunesListResponse>
}

struct MyTunesListUseCase: MyTunesListUseCaseType {
    func getCharacterList(params: [String : Any]) -> Observable<MyTunesListResponse> {
        return ApiClient.getMyTunesList(params: params)
    }

}
