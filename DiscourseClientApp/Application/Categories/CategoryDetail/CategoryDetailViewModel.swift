//
//  CategoryDetailViewModel.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import Foundation

class CategoryDetailViewProtocol {}

struct CategoryDetailViewStruct {
    let categoryId: String
    let categoryName: String
    let categoryColor: String
}

class CategoryDetailViewModel: ViewModel {
    typealias View = CategoryDetailViewProtocol
    typealias Coordinator = CategoryDetailCoordinator
    typealias UseCases = CategoryDetailUseCases
    
    weak var view: CategoryDetailViewProtocol?
    var coordinator: CategoryDetailCoordinator?
    var useCases: UseCases
    
    let categoryId: Int
    
    var onGetCategoryDetailSuccess: ((CategoryDetailViewStruct) -> ())?
    var onGetCategoryDetailFail: (() -> ())?
    
    init(categoryId: Int, useCases: CategoryDetailUseCases) {
        self.categoryId = categoryId
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchCategory(categoryId: categoryId) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                let categoryDetailViewStruct = CategoryDetailViewStruct(categoryId: "\(response.categoryDetail.id)", categoryName: response.categoryDetail.name, categoryColor: "\(response.categoryDetail.color)")
                self?.onGetCategoryDetailSuccess?(categoryDetailViewStruct)
            case .failure:
                self?.onGetCategoryDetailFail?()
            }
        }
    }
}
