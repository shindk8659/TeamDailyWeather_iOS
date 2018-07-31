//
//  APIRouter.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 31..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Alamofire

struct APIConfiguration {
    static let baseURL = "https://api2.sktelecom.com/weather"
    static let tweatherKey = "8ab05bc6-8297-4251-bb89-e7a085516286"
}

struct APIRouter {
    var url: String
    var method: HTTPMethod
    var parameters: Parameters?
    var headers: HTTPHeaders?
    
    init(url: String, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}

extension APIRouter {
    var requestUrl: String {
        return APIConfiguration.baseURL + url
    }
    var requestHeader: HTTPHeaders{
        return ["appKey" : APIConfiguration.tweatherKey]
    }
    
}
