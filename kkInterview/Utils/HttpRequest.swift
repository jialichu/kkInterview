//
//  HttpRequest.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import Foundation
import Alamofire

class ResponseData<T: Codable>: Codable {
    let response: [T]
}


class HttpRequest {
    
    static let shared = HttpRequest()
    private init (){}
    
    func fetch<T: Codable>(url: String, type: T.Type) async -> [T] {
        return await withCheckedContinuation { continuation in
            AF.request(url).responseDecodable(of: ResponseData<T>.self) { response in
                switch response.result {
                case .success(let data):
                    print(data.response)
                    continuation.resume(returning: data.response)
                case .failure(let error):
                    print(error)
                }
            }
        }        
    }
    
}
