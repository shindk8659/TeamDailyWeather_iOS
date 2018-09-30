//
//  NetworkRequestor .swift
//  DailyWeather
//
//  Created by 신동규 on 2018. 7. 31..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


enum NetworkError: Error {
    case failure
}
struct NetworkRequestor2{
    private var api2: APIRouter2
    private let manager = Alamofire.SessionManager.default
    public typealias Completion<T> = ((T?, Error?) -> Void)?
    public typealias CompletionJSON = ((JSON?, Error?) -> Void)?
    
    init(with router: APIRouter2) {
        self.api2 = router
        manager.session.configuration.timeoutIntervalForRequest = 15
    }
    func requestAPI<T: Codable>(completion: Completion<T>) {
        manager.request(api2.requestUrl, method: api2.method, parameters: api2.parameters, headers: api2.headers).responseJSON { response in
            switch response.result {
               
            case .success:
                print(JSON(response.data))
                if let data = response.data {
                    
                    print("성공")
                    let jsonString = JSON(data).description
                    let jsonData = jsonString.data(using: .utf8) ?? Data()
                    do {
                        let result = try JSONDecoder().decode(T.self, from: jsonData)
                        completion?(result, nil)
                    } catch let error {
                        completion?(nil, error)
                    }
                }
            case .failure(let error):
                print(response)
                print("아예실패")
                completion?(nil, error)
            }
        }
    }
    func requestUpload<T: Codable>(completion: Completion<T>) {
 
        manager.upload(multipartFormData: { multipartFormData in
            
            multipartFormData.append(self.api2.image!, withName: "image", fileName: "postImage.jpg", mimeType: "image/png")
            multipartFormData.append((self.api2.user_id?.data(using: .utf8))!, withName: "user_id")
            multipartFormData.append((self.api2.gu?.data(using: .utf8))!, withName: "gu")
            multipartFormData.append((self.api2.air_volume?.data(using: .utf8))!, withName: "air_volume")
            multipartFormData.append((self.api2.heat?.data(using: .utf8))!, withName: "heat")
            multipartFormData.append((self.api2.cold?.data(using: .utf8))!, withName: "cold")
            multipartFormData.append((self.api2.humidity?.data(using: .utf8))!, withName: "humidity")
            multipartFormData.append((self.api2.user_outer?.data(using: .utf8))!, withName: "user_outer")
            multipartFormData.append((self.api2.user_bottom?.data(using: .utf8))!, withName: "user_bottom")
            multipartFormData.append((self.api2.user_top?.data(using: .utf8))!, withName: "user_top")
            multipartFormData.append((self.api2.content?.data(using: .utf8))!, withName: "content")
       
        }, to: api2.requestUrl, method: api2.method, headers: api2.headers ){ encodingResult in
            print("여기부터")
            print(encodingResult)
            print("여긲따지")
            switch encodingResult{
                
            case .success(let upload, _, _):
               
                upload.responseData {
                    res in
                    switch res.result {
                    case .success:
                        if let data = res.data {
                        
                        guard JSON(data)["success"] == true else {
                            completion?(nil, NetworkError.failure)
                            return
                        }
                        print("성공")
                        let jsonString = JSON(data).description
                        let jsonData = jsonString.data(using: .utf8) ?? Data()
                        do {
                            let result = try JSONDecoder().decode(T.self, from: jsonData)
                            completion?(result, nil)
                        } catch let error {
                            completion?(nil, error)
                        }
                        }
                    
                    case .failure(let err):
                        print("upload Error : \(err)")
                        
                        print("아예실패")
                        completion?(nil, err)
                      
                    }
                }
     
            case .failure(let error):
            print("아예실패")
            completion?(nil, error)
              
            }
            
        }
      
    }
    
}

struct NetworkRequestor {
    
    private var api: APIRouter
    private let manager = Alamofire.SessionManager.default
    public typealias Completion<T> = ((T?, Error?) -> Void)?
    public typealias CompletionJSON = ((JSON?, Error?) -> Void)?
    
    init(with router: APIRouter) {
        self.api = router
        manager.session.configuration.timeoutIntervalForRequest = 15
    }
    
    func request<T: Codable>(completion: Completion<T>) {
        manager.request(api.requestUrl, method: api.method, parameters: api.parameters, headers: api.requestHeader).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    guard JSON(data)["result"]["message"].stringValue == "성공" else {
                        completion?(nil, NetworkError.failure)
                        return
                    }
                    let jsonString = JSON(data).description
                    let jsonData = jsonString.data(using: .utf8) ?? Data()
                    do {
                        let result = try JSONDecoder().decode(T.self, from: jsonData)
                        completion?(result, nil)
                    } catch let error {
                        completion?(nil, error)
                    }
                }
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
    func requestAPI<T: Codable>(completion: Completion<T>) {
        manager.request(api.requestUrl, method: api.method, parameters: api.parameters, headers: api.requestHeader).responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    guard JSON(data)["success"] == true else {
                        completion?(nil, NetworkError.failure)
                        return
                    }
                    let jsonString = JSON(data).description
                    let jsonData = jsonString.data(using: .utf8) ?? Data()
                    do {
                        let result = try JSONDecoder().decode(T.self, from: jsonData)
                        completion?(result, nil)
                    } catch let error {
                        completion?(nil, error)
                    }
                }
            case .failure(let error):
                completion?(nil, error)
            }
        }
    }
    
   
}
