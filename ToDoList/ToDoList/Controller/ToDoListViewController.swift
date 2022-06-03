//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by TarıkOzturk on 3.06.2022.
//
 import UIKit
 import SnapKit

class ToDoListViewController : UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UIView()
    private let toDoCreateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configure()
        }
    
   private func configure() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(toDoCreateButton)
        view.backgroundColor = .white
       
        drawDesign()
        makeTitleLabel()
        makeTableView()
        makeToDoCreateButton()
    }
    
    private func drawDesign() {
        self.view.backgroundColor = .white
        tableView.backgroundColor = .purple
        titleLabel.text = "ToDoList"
    }
    
    private func makeTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(titleLabel)
        }
    }
    
    private func makeToDoCreateButton() {
        toDoCreateButton.setTitle("+", for: .normal)
        toDoCreateButton.setTitleColor(UIColor.purple, for: .normal)
        toDoCreateButton.layer.borderWidth = 2
        toDoCreateButton.layer.cornerRadius = 5
        toDoCreateButton.layer.masksToBounds = true
        toDoCreateButton.snp.makeConstraints { make in
            make.height.equalTo(titleLabel)
            make.right.equalTo(titleLabel).offset(-5)
            make.top.equalTo(titleLabel)
        }
    }
    
}

