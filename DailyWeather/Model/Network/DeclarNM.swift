//
//  DeclarNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 25..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
class DeclarNM {
    
    func declar(_id: String,token:String, completion: @escaping (Feed?) -> Void) {
        
        let usertoken:HTTPHeaders = ["x-access-token" : token]
        
        let router = APIRouter2(url: "/api/contents/\(_id)/notify_count", method: .put, parameters: nil ,headers:usertoken)
        NetworkRequestor2(with: router).requestAPI { (delete: Feed?, error) in
            
            
            guard error == nil else {
                completion(nil)
                return
            }
            completion(delete)
        }
    }
   
    
}
