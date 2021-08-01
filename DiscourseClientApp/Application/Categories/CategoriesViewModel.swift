//
//  CategoriesViewModel.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import Foundation

protocol CategoriesViewProtocol: AnyObject {
    func categoriesFetched()
    func errorFetchingCategories(error: String)
}

class CategoriesViewModel: ViewModel {
    typealias View = CategoriesViewProtocol
    typealias Coordinator = CategoriesCoordinator
    typealias UseCases = CategoriesUseCases
    
    weak var view: CategoriesViewProtocol?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    var categoriesCellViewModels: [CategoryCellViewModel] = []
       
    init(useCases: CategoriesUseCases) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchAllCategories { [weak self] result in
            switch result{
            case .success(let response):
                guard let categories = response?.categoryList.categories else { return }
                self?.categoriesCellViewModels = categories.map { CategoryCellViewModel(category: $0) }
                self?.view?.categoriesFetched()
                
            case .failure(let error):
                guard let responseError = error as? DiscourseClientApp.SessionAPIError else {
                    self?.view?.errorFetchingCategories(error: "")
                    return
                }
                var message = error.localizedDescription
                
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error code: \(code)"
                }
                
                self?.view?.errorFetchingCategories(error: message)
            }
            
        }
    }
    
    func numberOfRows(in: Int) -> Int {
        return categoriesCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoriesCellViewModels.count else { return nil }
        return categoriesCellViewModels[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < categoriesCellViewModels.count else { return }
        coordinator?.didSelectCategory(category: categoriesCellViewModels[indexPath.row].category)
    }
}
