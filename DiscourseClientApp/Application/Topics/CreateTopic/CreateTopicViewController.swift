//
//  CreateTopicViewController.swift
//  DiscourseClientApp
//
//  Created by José Ángel Rodríguez on 20/7/21.
//

import UIKit

class CreateTopicViewController: UIViewController {

    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
            textField.placeholder = "Insert topic title and tap submit"
        }
    }
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.setTitle("Submit", for: .normal)
            submitButton.backgroundColor = .gray
            submitButton.setTitleColor(.black, for: .normal)
            submitButton.layer.cornerRadius = 10
            submitButton.isEnabled = false
        }
    }
    
    let viewModel: CreateTopicViewModel
    
    init(viewModel: CreateTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        viewModel.onCreateTopicSuccess = { [weak self] in
            self?.hideLoader()
            self?.showAlert(title: "Topic created!", message: "")
        }
        
        viewModel.onCreateTopicFail = { [weak self] error in
            self?.hideLoader()
            self?.showAlert(title: error, message: "")
        }
    }
    
    
    @IBAction func onTapSubmitButton(_ sender: Any) {
        guard let name = textField.text, !name.isEmpty else { showAlert(title: "Error in textField", message: ""); return }
        showLoader()
        viewModel.onTapSubmitButton(title: name)
            
    }
}

extension CreateTopicViewController: CreateTopicViewProtocol {
    
}

extension CreateTopicViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count + string.count > 0 {
            self.submitButton.isEnabled = true
            submitButton.backgroundColor = .green
        } else {
            self.submitButton.isEnabled = false
            submitButton.backgroundColor = .gray
        }
        return true
    }
}
