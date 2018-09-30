//
//  GetmyFeedDataNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 24..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
class DeleteDataNM {
    
    func deletedata(_id: String,token:String, completion: @escaping (Delete?) -> Void) {
        
        let usertoken:HTTPHeaders = ["x-access-token" : token]
        
        let router = APIRouter2(url: "/api/contents/\(_id)", method: .delete, parameters: nil ,headers:usertoken)
        NetworkRequestor2(with: router).requestAPI { (delete: Delete?, error) in
            
            
            guard error == nil else {
                completion(nil)
                return
            }
            completion(delete)
        }
    }
    func getmyfeeddata(user_id: String,token:String, completion: @escaping (Feed?) -> Void) {
        
        let usertoken:HTTPHeaders = ["x-access-token" : token]
        
        let router = APIRouter2(url: "/api/mypage/\(user_id)", method: .get, parameters: nil ,headers:usertoken)
        NetworkRequestor2(with: router).requestAPI { (feed: Feed?, error) in
            
            guard error == nil else {
                completion(nil)
                return
            }
            completion(feed)
        }
    }
    
    
    
}
