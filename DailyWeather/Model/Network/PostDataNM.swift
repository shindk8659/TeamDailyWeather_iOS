//
//  PostDataNM.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 21..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire

class PostDataNM {
    
    func join(token:String,image:Data ,user_id:String,gu:String,air_volume:String,heat:String,cold:
        String,humidity: String,user_outer:String,user_top:String,user_bottom:String,content:String, completion: @escaping (Post?) -> Void) {
        
        
        let usertoken:HTTPHeaders = ["x-access-token" : token]
        
        let router = APIRouter2(url: "/api/contents", method: .post, headers: usertoken , image: image, gu: gu, user_id: user_id, air_volume: air_volume, heat: heat, cold: cold, humidity: humidity, user_outer: user_outer, user_top: user_top, user_bottom: user_bottom, content: content)
        NetworkRequestor2(with: router).requestUpload{ (join: Post?, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            completion(join)
        }
    }
    
    
    
}
