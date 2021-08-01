//
//  TopicCell.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 19/7/21.
//

import Foundation
import UIKit

class TopicCell: UITableViewCell {
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.topic.title
        }
    }
}
