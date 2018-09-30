//
//  Password.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 23..
//  Copyright © 2018년 신동규. All rights reserved.
//


import Foundation
struct Password : Codable {
    let message : String?
    
    enum CodingKeys: String, CodingKey {
        
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
}
