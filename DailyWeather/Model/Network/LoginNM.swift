//
//  LoginNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation

class LoginNM {
    
    func login(id:String, pass:String, completion: @escaping (Login?) -> Void) {
        let parameters = ["id": id, "password": pass]
        let router = APIRouter2(url:"/api/auth/login", method: .post, parameters: parameters)
        NetworkRequestor2(with: router).requestAPI { (login: Login?, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(login)
        }
    }
    
    
    
}
