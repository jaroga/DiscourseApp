//
//  TopicDetailViewModel.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation

protocol TopicDetailViewProtocol: AnyObject {}

struct TopicDetailViewStruct {
    let topicId: String
    let topicName: String
    let postsNumbers: String
}

class TopicDetailViewModel: ViewModel {
    typealias View = TopicDetailViewProtocol
    typealias Coordinator = TopicDetailCoordinator
    typealias UseCases = TopicDetailUseCases
    
    weak var view: TopicDetailViewProtocol?
    var coordinator: TopicDetailCoordinator?
    var useCases: UseCases
    
    let topicId: Int
    
    var onGetTopicSuccess: ((TopicDetailViewStruct) -> ())?
    var onGetTopicFail: (() -> ())?
    
    init(topicId: Int, useCases: TopicDetailUseCases) {
        self.topicId = topicId
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchTopic(id: topicId) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                let topicDetailViewStruct = TopicDetailViewStruct(topicId: "\(response.id)", topicName: response.title, postsNumbers: "\(response.postsCount)")
                self?.onGetTopicSuccess?(topicDetailViewStruct)
            case .failure:
                self?.onGetTopicFail?()
            }
        }
    }
}
