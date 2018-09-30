//
//  JoinData.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 14..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
struct JoinData : Codable {
    let __v : Int?
    let id : String?
    let password : String?
    let gu : String?
    let _id: String?
    
    enum CodingKeys: String, CodingKey {
        
        case __v = "__v"
        case id = "id"
        case password = "password"
        case gu = "gu"
        case _id = "_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        __v = try values.decodeIfPresent(Int.self, forKey: .__v)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        gu = try values.decodeIfPresent(String.self, forKey: .gu)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)

    }
    
}
