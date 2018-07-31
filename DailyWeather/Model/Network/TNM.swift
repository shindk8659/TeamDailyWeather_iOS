//
//  TmapNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 31..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation

class TNM{
    
    func TWeather(city:String,county:String, village: String ,completion: @escaping (TWeahter?) -> Void) {
        let parameters = ["city": city,"county": county,"village": village]
        let router = APIRouter(url:"/current/minutely", method: .get, parameters: parameters)
        NetworkRequestor(with: router).request { (temp: TWeahter?, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(temp)
        }
    }
    
    
    func TUV(lon:String, lat:String ,completion: @escaping (TUV?) -> Void) {
        let parameters = ["lat": lat,"lon": lon]
        let router = APIRouter(url:"/index/uv", method: .get, parameters: parameters)
        NetworkRequestor(with: router).request { (uv: TUV?, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(uv)
        }
    }
    func TWCT(lon:String, lat:String ,completion: @escaping (TWCT?) -> Void) {
        let parameters = ["lat": lat,"lon": lon]
        let router = APIRouter(url:"/index/wct", method: .get, parameters: parameters)
        NetworkRequestor(with: router).request { (wct: TWCT?, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(wct)
        }
    }
}
