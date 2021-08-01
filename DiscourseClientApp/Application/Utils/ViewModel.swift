//
//  ViewModel.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 14/7/21.
//

import Foundation
protocol ViewModel {
    associatedtype View // La vista será un propio protocolo
    associatedtype Coordinator // será el propio coordinator
    associatedtype UseCases
    
    var view: View? { get } // weak
    var coordinator: Coordinator? { get }
    var useCases: UseCases { get }
}
