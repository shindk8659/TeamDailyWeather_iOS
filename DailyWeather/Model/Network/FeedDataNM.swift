//
//  FeedDataNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 16..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
class FeedDataNM {
    
    func getfeeddata(gu: String,token:String, completion: @escaping (Feed?) -> Void) {
        
        let parms = [ "gu" : gu ]

        let usertoken:HTTPHeaders = ["x-access-token" : token]
     
        let router = APIRouter2(url: "/api/contents/main", method: .get, parameters: parms ,headers:usertoken)
        NetworkRequestor2(with: router).requestAPI { (feed: Feed?, error) in
      
            guard error == nil else {
                completion(nil)
                return
            }
            completion(feed)
        }
    }
    
    
    
}
