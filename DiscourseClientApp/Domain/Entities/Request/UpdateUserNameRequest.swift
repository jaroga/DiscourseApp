//
//  UpdateUserNameRequest.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 15/7/21.
//

import Foundation

class UpdateUserNameRequest: APIRequest {
    typealias Response = UpdateUserNameResponse
    
    let username: String
    let name: String
    
    init(username: String, name: String) {
        self.username = username
        self.name = name
    }
    
    var method: Method {
        return .PUT
    }
    
    var path: String {
        return "/users/\(username)"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return ["name": name]
    }
    
    
}
