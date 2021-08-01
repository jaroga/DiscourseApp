//
//  CategoriesUseCases.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import Foundation
protocol CategoriesUseCases {
    func fetchAllCategories(completion: @escaping(Result<CategoriesResponse?, Error>) -> ())
}

extension DataManager: CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllCategories(completion: completion)
    }
}

extension RemoteDataManager: CategoriesUseCases {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ()) {
        let request = CategoriesRequest()
        session.request(request: request, completion: completion)
    }
}
