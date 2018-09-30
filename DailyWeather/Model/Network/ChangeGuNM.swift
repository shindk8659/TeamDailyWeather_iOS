//
//  ChangeGuNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 24..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
class ChangeGuNM {
    
    func changegudata(id:String,gu: String,token:String, completion: @escaping (ChangeGu?) -> Void) {
        
        let parms = [ "gu" : gu ]
        
        let usertoken:HTTPHeaders = ["x-access-token" : token]
        
        let router = APIRouter2(url: "/api/mypage/updateGu/\(id)", method: .put, parameters: parms ,headers:usertoken)
        NetworkRequestor2(with: router).requestAPI { (changedgu: ChangeGu?, error) in
            
            guard error == nil else {
                completion(nil)
                return
            }
            completion(changedgu)
        }
    }
    
    
    
}
