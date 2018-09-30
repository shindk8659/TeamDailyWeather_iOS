//
//  JoinMessage.swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 8. 16..
//  Copyright © 2018년 신동규. All rights reserved.
//


import Foundation
struct JoinMessage : Codable {
    let success : Bool?
    enum CodingKeys: String, CodingKey {
        
        case success = "success"
 
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
    }
    
}
