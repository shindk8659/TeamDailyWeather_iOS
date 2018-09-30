//
//  JoinNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 14..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation

class JoinNM {
    
    func join(id:String, pass:String, passcheck:String, gu:String, completion: @escaping (Join?) -> Void) {
        let parameters = ["id": id, "password": pass,"passwordConfirmation":passcheck,"gu":gu]
        let router = APIRouter2(url:"/api/users", method: .post, parameters: parameters)
        NetworkRequestor2(with: router).requestAPI { (join: Join?, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(join)
        }
    }
    
    
    
}
