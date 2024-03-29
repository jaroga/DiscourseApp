//
//  TopicsViewModel.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import UIKit

protocol TopicsViewProtocol: AnyObject{
    func topicsFetched()
    func errorFetchingTopics()
}

class TopicsViewModel: ViewModel {
    typealias View = TopicsViewProtocol
    typealias Coordinator = TopicsCoordinator
    typealias UseCases = TopicsUseCases
    
    weak var view: TopicsViewProtocol?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    var topicCellViewModels: [TopicCellViewModel] = []
       
    init(useCases: TopicsUseCases) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchAllTopics { [weak self] result in
            switch result{
            case .success(let response):
                guard let topics = response?.topicList.topics else { return }
                self?.topicCellViewModels = topics.map { TopicCellViewModel(topic: $0) }
                self?.view?.topicsFetched()
            case .failure:
                self?.view?.errorFetchingTopics()
            }
            
        }
    }
    
    func numberOfRows(in: Int) -> Int {
        return topicCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TopicCellViewModel? {
        guard indexPath.row < topicCellViewModels.count else { return nil }
        return topicCellViewModels[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < topicCellViewModels.count else { return }
        coordinator?.didSelectTopic(topic: topicCellViewModels[indexPath.row].topic)
    }
    
    func onTapAddButton() {
        coordinator?.onTapAddButton()
    }
}
