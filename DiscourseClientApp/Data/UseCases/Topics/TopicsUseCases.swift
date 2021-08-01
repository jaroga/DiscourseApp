//
//  TopicsUseCases.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation

protocol TopicsUseCases {
    func fetchAllTopics(completion: @escaping(Result<LatestTopicsResponse?, Error>) -> ())
    
}

extension DataManager: TopicsUseCases {
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllTopics(completion: completion)
    }
    
    
}

extension RemoteDataManager: TopicsUseCases {
    func fetchAllTopics(completion: @escaping (Result<LatestTopicsResponse?, Error>) -> ()) {
        let request = LatestTopicsRequest()
        session.request(request: request, completion: completion)
    }
    
    
}
