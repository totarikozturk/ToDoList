//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit

class  DetailToDoViewController: UIViewController {
    
    private let cancelButton = UIButton()
    private let doneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubview(cancelButton)
        view.addSubview(doneButton)
        view.backgroundColor = .systemTeal
        makeCancelButton()
        makeDoneButton()
        cancelButton.addTarget(self, action: #selector(backTodoList), for: .touchUpInside)
    }
    
    @objc func backTodoList() {
        dismiss(animated: true)
    }
    
    private func makeCancelButton() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 24)
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 5
        cancelButton.clipsToBounds = true
        cancelButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 50))
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(UIColor.purple, for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 24)
        doneButton.layer.borderWidth = 1
        doneButton.layer.cornerRadius = 5
        doneButton.clipsToBounds = true
        doneButton.layer.masksToBounds = true
        doneButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 75, height: 50))
            make.height.equalTo(cancelButton)
            //make.left.equalTo(cancelButton.snp_rightMargin).offset(5)
            make.right.equalTo(view).offset(-5)
            make.top.equalTo(cancelButton)
        }
    }
}


