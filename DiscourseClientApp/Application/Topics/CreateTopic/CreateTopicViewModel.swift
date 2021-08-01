//
//  CreateTopicViewModel.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 20/7/21.
//

import Foundation
protocol CreateTopicViewProtocol {}

class CreateTopicViewModel: ViewModel {
    typealias View = CreateTopicViewProtocol
    typealias Coordinator = CreateTopicCoordinator
    typealias UseCases = CreateTopicUseCases    
    
    var view: CreateTopicViewProtocol?
    var coordinator: CreateTopicCoordinator?
    var useCases: UseCases
    
    init(createTopicUseCases: CreateTopicUseCases) {
        useCases = createTopicUseCases
    }
    
    var onCreateTopicSuccess: (() -> ())?
    var onCreateTopicFail: ((String) -> ())?
    
    func onTapSubmitButton(title: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let createAt = dateFormatter.string(from: Date())
        
        useCases.fetchCreateTopic(title: title, raw: title, createdAt: createAt) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                self?.onCreateTopicSuccess?()
            case .failure(let error):
                guard let responseError = error as? DiscourseClientApp.SessionAPIError else {
                    self?.onCreateTopicFail?("")
                    return
                }
                var message = error.localizedDescription
                
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error code: \(code)"
                }
                self?.onCreateTopicFail?(message)
            }
        }
    }
}
