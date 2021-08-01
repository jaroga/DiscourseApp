//
//  Category.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 28/7/21.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    let viewModel: CategoryDetailViewModel
    
    var labelCategoryId: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var categoryIdStackView: UIStackView = {
        let labelCategoryIdTitle = UILabel()
        labelCategoryIdTitle.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryIdTitle.text = "Category Id: "
        
        let categoryIdStackView = UIStackView(arrangedSubviews: [labelCategoryIdTitle, labelCategoryId])
        categoryIdStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryIdStackView.axis = .horizontal
        return categoryIdStackView
    }()
    
    var labelCategoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var categoryNameStackView: UIStackView = {
        let labelCategoryNameTitle = UILabel()
        labelCategoryNameTitle.translatesAutoresizingMaskIntoConstraints = false
        labelCategoryNameTitle.text = "Category Name: "
        
        let categoryNameStackView = UIStackView(arrangedSubviews: [labelCategoryNameTitle, labelCategoryName])
        categoryNameStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryNameStackView.axis = .horizontal
        return categoryNameStackView
    }()
    
    var categoryColor: UIView = {
        let colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        return colorView
    }()
    
    lazy var categoryColorStackView: UIStackView = {
        let categoryColorStackView = UIStackView(arrangedSubviews: [categoryColor])
        categoryColorStackView.translatesAutoresizingMaskIntoConstraints = false
        categoryColorStackView.axis = .horizontal
        return categoryColorStackView
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(categoryIdStackView)
        NSLayoutConstraint.activate([
            categoryIdStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            categoryIdStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
        
        view.addSubview(categoryNameStackView)
        NSLayoutConstraint.activate([
            categoryNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            categoryNameStackView.topAnchor.constraint(equalTo: categoryIdStackView.bottomAnchor, constant: 32)
        ])
        
        view.addSubview(categoryColorStackView)
        NSLayoutConstraint.activate([
            categoryColorStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryColorStackView.widthAnchor.constraint(equalToConstant: 150),
            categoryColorStackView.heightAnchor.constraint(equalToConstant: 100),
            categoryColorStackView.topAnchor.constraint(equalTo: categoryNameStackView.bottomAnchor, constant: 32),
        ])
    }
    
    init(viewModel: CategoryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoader()
        }
        
        viewModel.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.onGetCategoryDetailSuccess = { [weak self] categoryDetailViewStruct in
            self?.hideLoader()
            
            self?.labelCategoryId.text = categoryDetailViewStruct.categoryId
            self?.labelCategoryName.text = categoryDetailViewStruct.categoryName
            self?.categoryColor.backgroundColor = UIColor(hex: "#\(categoryDetailViewStruct.categoryColor)ff")
        }
        
        viewModel.onGetCategoryDetailFail = { [weak self] in
            self?.hideLoader()
            self?.showAlert(title: "Error Fetching Categoriy", message: "")
        }
    }
}
