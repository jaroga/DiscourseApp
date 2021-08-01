//
//  LatestTopicsRequest.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation

struct LatestTopicsRequest: APIRequest {
    typealias Response = LatestTopicsResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/latest.json"
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
