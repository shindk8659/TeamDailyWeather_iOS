//
//  GetAvgNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 25..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
class GetAvgNM {
    
    func deletedata(gu: String, completion: @escaping (AvgData?) -> Void) {
        
        let parms = ["gu":gu]
        
        let router = APIRouter2(url: "/api/contents/avg", method: .get, parameters: parms ,headers:nil)
        NetworkRequestor2(with: router).requestAPI { (avg: AvgData?, error) in
        
            guard error == nil else {
                completion(nil)
                return
            }
            completion(avg)
        }
    }
    
}
