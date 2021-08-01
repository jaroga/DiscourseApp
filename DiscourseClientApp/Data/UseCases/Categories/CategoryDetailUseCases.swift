//
//  CategoryDetailUseCases.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import Foundation

protocol CategoryDetailUseCases {
    func fetchCategory(categoryId: Int, completion: @escaping(Result<CategoryDetailResponse?, Error>) -> ())
}

extension DataManager: CategoryDetailUseCases {
    func fetchCategory(categoryId: Int, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchCategory(categoryId: categoryId, completion: completion)
    }
}

extension RemoteDataManager: CategoryDetailUseCases {
    func fetchCategory(categoryId: Int, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        let request = CategoryDetailRequest(categoryId: categoryId)
        session.request(request: request, completion: completion)
    }
}
