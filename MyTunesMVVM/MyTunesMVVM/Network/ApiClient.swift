//
//  ApiClient.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//

import Foundation
import RxSwift
import Alamofire

class ApiClient {
    
    static func getMyTunesList(params: [String: Any]) -> Observable<MyTunesListResponse> {
        return request(ApiEndPoint.myTunesList(params: params))
    }

    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        print(urlConvertible.urlRequest)
          //Create an RxSwift observable, which will be the one to call the request when subscribed to
          return Observable<T>.create { observer in
              //Trigger the HttpRequest using AlamoFire (AF)
              let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                  //Check the result from Alamofire's response and check if it's a success or a failure
                  switch response.result {

                  case .success(let value):
                      //Everything is fine, return the value in onNext
                    
                      observer.onNext(value)
                      observer.onCompleted()
                  case .failure(let error):
                      //Something went wrong, switch on the status code and return the error
                      print(response.response)
                      print(response.data)
                      print(response.description)
                      print(error.errorDescription)
                      observer.onError(error)
                      observer.onCompleted()
                  }
              }
              //Finally, we return a disposable to stop the request
              return Disposables.create {
                  request.cancel()
              }
          }
      }
  }

