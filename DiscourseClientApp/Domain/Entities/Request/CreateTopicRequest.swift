//
//  CreateTopicRequest.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 20/7/21.
//

import Foundation
struct CreateTopicRequest: APIRequest {
    typealias Response = CreateTopicResponse
    
    let title: String
    let raw: String
    let createdAt: String
    
    init(title: String, raw: String, createdAt: String) {
        self.title = title
        self.raw = raw
        self.createdAt = createdAt
    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/posts.json"
    }
    
    var parameters: [String : String] {
        [ : ]
    }
    
    var headers: [String : String] {
        [ : ]
    }
    
    var body: [String : Any] {
        [
            "title" : title,
            "raw" : raw,
            "create_at" : createdAt
        ]
    }
}
