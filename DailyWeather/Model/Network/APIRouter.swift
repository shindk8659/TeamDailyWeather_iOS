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
    static let baseURL2 = "http://13.209.26.77:3000"
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
struct APIRouter2 {
    var url: String
    var method: HTTPMethod
    var parameters: Parameters?
    var headers: HTTPHeaders?
    //이미지 보낼때
    var image: Data?
    var user_id:String?
    var gu:String?
    var air_volume:String?
    var heat:String?
    var cold:String?
    var humidity: String?
    var user_outer:String?
    var user_top:String?
    var user_bottom:String?
    var content:String?
    
    
    init(url: String, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil,
         image:Data? = nil,gu:String? = nil,user_id:String? = nil, air_volume:String? = nil, heat:String? = nil, cold:String? = nil, humidity:String? = nil, user_outer:String? = nil,user_top:String? = nil,user_bottom:String? = nil,content:String? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.image = image
        self.user_id = user_id
        self.gu = gu
        self.air_volume = air_volume
        self.heat = heat
        self.cold = cold
        self.humidity = humidity
        self.user_outer = user_outer
        self.user_top = user_top
        self.user_bottom = user_bottom
        self.content = content
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

extension APIRouter2 {
    var requestUrl: String {
        return APIConfiguration.baseURL2 + url
    }
   
    
}
