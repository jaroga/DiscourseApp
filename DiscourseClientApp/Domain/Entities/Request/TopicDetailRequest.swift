//
//  TopicDetailRequest.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation
struct TopicDetailRequest: APIRequest {
    typealias Response = TopicDetailResponse
    
    let id: Int
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/t/\(id).json"
    }
    
    var parameters: [String : String] {
        [ : ]
    }
    
    var headers: [String : String] {
        [ : ]
    }
    
    var body: [String : Any] {
        [ : ]
    }
}
