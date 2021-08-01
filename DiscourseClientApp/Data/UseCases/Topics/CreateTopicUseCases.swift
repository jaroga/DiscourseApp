//
//  CreateTopicUseCases.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 20/7/21.
//

import Foundation
protocol CreateTopicUseCases {
    func fetchCreateTopic(title: String, raw: String, createdAt: String, completion: @escaping(Result<CreateTopicResponse?, Error>) -> ())
}

extension DataManager: CreateTopicUseCases {
    func fetchCreateTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<CreateTopicResponse?, Error>) -> ()) {
        remoteDataManager.fetchCreateTopic(title: title, raw: raw, createdAt: createdAt, completion: completion)
    }
}

extension RemoteDataManager: CreateTopicUseCases {
    func fetchCreateTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<CreateTopicResponse?, Error>) -> ()) {
        let fetchCreateTopicRequest = CreateTopicRequest(title: title, raw: raw, createdAt: createdAt)
        session.request(request: fetchCreateTopicRequest, completion: completion)
    }
}
