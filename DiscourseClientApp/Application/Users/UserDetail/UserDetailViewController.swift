//
//  UserDetailViewController.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 15/7/21.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    lazy var labelUserIDValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userIDStackView: UIStackView = {
        let labelUserId = UILabel()
        labelUserId.translatesAutoresizingMaskIntoConstraints = false
        labelUserId.text = "User ID: "
        
        let stack = UIStackView(arrangedSubviews: [labelUserId, labelUserIDValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    lazy var labelNameValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameStackView: UIStackView = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "Username: "
        
        let stack = UIStackView(arrangedSubviews: [labelName, labelNameValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    lazy var updateNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(updateNameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var textFieldUserName: UITextField = {
        let textFieldUsername = UITextField()
        textFieldUsername.borderStyle = .line
        textFieldUsername.translatesAutoresizingMaskIntoConstraints = false
        return textFieldUsername
    }()
    
    lazy var newUserNameStackView: UIStackView = {
        let labelNewName = UILabel()
        labelNewName.translatesAutoresizingMaskIntoConstraints = false
        labelNewName.text = "New User Name: "
        
        let stack = UIStackView(arrangedSubviews: [labelNewName, textFieldUserName])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    
    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 128)
        ])
        
        view.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 32)
        ])
        
        view.addSubview(newUserNameStackView)
        NSLayoutConstraint.activate([
            newUserNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            newUserNameStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32),
            textFieldUserName.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(updateNameButton)
        NSLayoutConstraint.activate([
            updateNameButton.topAnchor.constraint(equalTo: newUserNameStackView.bottomAnchor, constant: 32),
            updateNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateNameButton.heightAnchor.constraint(equalToConstant: 40),
            updateNameButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [unowned self] in
//            self.showLoader()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoader()
    }
    
    @objc func updateNameButtonTapped() {
        guard let name = textFieldUserName.text, !name.isEmpty else { showAlert(title: "Error in textField", message: ""); return }
        showLoader()
        viewModel.omTapUpdateUserName(name: name)
    }
    
    private func updateData(userDetail: UserDetailViewStruct) {
        labelUserIDValue.text = userDetail.userId
        labelNameValue.text = userDetail.nameLabel
        
        updateNameButton.isHidden = !userDetail.canEditName
        newUserNameStackView.isHidden = !userDetail.canEditName
        hideLoader()
    }
    
    private func showErrorFetchingUser() {
        showAlert(title: "Error fetching user", message: "")
        hideLoader()
    }
    
}

extension UserDetailViewController: UserDetailViewProtocol {
    func onGetUserSuccess(userDetail: UserDetailViewStruct) {
        updateData(userDetail: userDetail)
    }
    
    func onGetUserFail() {
        showErrorFetchingUser()
    }
    
    func onUpdateUserNameSuccess() {
        showAlert(title: "Datos guardados correctamente", message: "")
        hideLoader()
    }
    
    func onUpdateUserNameFail() {
        showAlert(title: "Error Updating User", message: "")
        hideLoader()
    }
    
}
