//
//  CategoryDetailRequest.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import Foundation

class CategoryDetailRequest: APIRequest {
    typealias Response = CategoryDetailResponse
    
    let categoryId: Int
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/c/\(categoryId)/show.json"
    }
    
    var parameters: [String:String] {
        return [:]
    }
    
    var headers: [String:String] {
        return [:]
    }
    
    var body: [String:Any] {
        return [:]
    }
}
