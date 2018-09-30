//
//  login.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
struct Login : Codable {
    let success : Bool?
    let message : String?
    let errors : String?
    let data : String?
    let gu: String?
    let id : String?
    let _id: String?
    
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
        case message = "message"
        case errors = "errors"
        case data = "data"
        case gu = "gu"
        case _id = "_id"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        errors = try values.decodeIfPresent(String.self, forKey: .errors)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        gu = try values.decodeIfPresent(String.self, forKey: .gu)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}
