//
//  UserCell.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 14/7/21.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.view = self
            textLabel?.text = viewModel.textLabel
            imageView?.image = viewModel.userImage
        }
    }
}

extension UserCell: UserCellViewProtocol {
    func userImageFetched() {
        imageView?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
