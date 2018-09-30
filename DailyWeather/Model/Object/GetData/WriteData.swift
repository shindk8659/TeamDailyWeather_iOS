//
//  WriteData.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 17..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
struct WriteData : Codable {
    let success : Bool?
    let message : String?
    let errors : String?
    let data : FeedData?
    
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
        case message = "message"
        case errors = "errors"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        errors = try values.decodeIfPresent(String.self, forKey: .errors)
        data = try values.decodeIfPresent(FeedData.self, forKey: .data)
    }
    
}
