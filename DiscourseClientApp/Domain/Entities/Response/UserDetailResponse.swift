//
//  UserDetailResponse.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 15/7/21.
//

import Foundation

struct UserDetailResponse: Codable {
    let user: UserDetail
}

struct UserDetail: Codable {
    let id: Int
    let username: String
    let name: String
    let canEditName: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case canEditName = "can_edit_name"
    }
    
}
