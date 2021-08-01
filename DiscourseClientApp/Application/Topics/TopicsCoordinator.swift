//
//  TopicsCoordinator.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation
import UIKit

class TopicsCoordinator: Coordinator {
    var navigator: UINavigationController
    let topicsUseCases: TopicsUseCases
    let topicDetailUseCases: TopicDetailUseCases = DataManager(remoteDataManager: RemoteDataManager())
    
    let createTopicUseCases: CreateTopicUseCases = DataManager(remoteDataManager: RemoteDataManager())
    
    init(navigator: UINavigationController, topicsUseCases: TopicsUseCases) {
        self.navigator = navigator
        self.topicsUseCases = topicsUseCases
    }
    
    func start() {
        let topicsViewModel = TopicsViewModel(useCases: topicsUseCases)
        let topicsViewController = TopicsViewController(viewModel: topicsViewModel)
        topicsViewController.title = "Topics"
        topicsViewModel.view = topicsViewController
        topicsViewModel.coordinator = self
        navigator.pushViewController(topicsViewController, animated: false)
    }
    
    func didSelectTopic(topic: Topic){
        let topicDetailCoordinator = TopicDetailCoordinator(navigator: navigator, topicId: topic.id, useCases: topicDetailUseCases)
        topicDetailCoordinator.start()
    }
    
    func onTapAddButton(){
        let createTopicCoordinator = CreateTopicCoordinator(navigator: navigator, createTopicUseCases: createTopicUseCases)
        createTopicCoordinator.start()
    }
}
