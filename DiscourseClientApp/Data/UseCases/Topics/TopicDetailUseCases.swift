//
//  TopicDetailUseCases.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation
protocol TopicDetailUseCases {
    func fetchTopic(id: Int, completion: @escaping(Result<TopicDetailResponse?, Error>) -> ())
}

extension DataManager: TopicDetailUseCases {
    func fetchTopic(id: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchTopic(id: id, completion: completion)
    }
}

extension RemoteDataManager: TopicDetailUseCases {
    func fetchTopic(id: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ()) {
        let fetchTopicRequest = TopicDetailRequest(id: id)
        session.request(request: fetchTopicRequest, completion: completion)
    }
}
