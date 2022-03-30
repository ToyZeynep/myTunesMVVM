//
//  ApiEndPoints.swift
//  MyTunesMVVM
//
//  Created by MacOS on 30.03.2022.
//


import Foundation
import Alamofire

enum ApiEndPoint: APIConfiguration {
    
    case myTunesList(params: [String: Any])
    
    var method: HTTPMethod {
        switch self {
        case .myTunesList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .myTunesList:
            return "search"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .myTunesList(let params):
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        //: https://itunes.apple.com/search?term=jack+johnson&limit=25
        let url = try "https://itunes.apple.com/".asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Parameters
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
        
    }
}

