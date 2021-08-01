//
//  CategoriesCell.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    var viewModel: CategoryCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.category.name
            backgroundColor = UIColor(hex: "#\(viewModel.category.color)ff")
        }
    }
}
