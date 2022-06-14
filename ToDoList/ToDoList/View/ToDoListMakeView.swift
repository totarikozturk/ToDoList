//
//  ToDoListMakeView.swift
//  ToDoList
//
//  Created by TarıkOzturk on 11.06.2022.
//

import UIKit

extension ToDoListViewController {
    
    func configureView() {
        drawDesign()
        makeTitleLabel()
        makeTableView()
        makeToDoCreateButton()
        toDoCreateButton.addTarget(self, action: #selector(openCreateTodoView), for: .touchUpInside)
    }
    
    func drawDesign() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(toDoCreateButton)
        view.backgroundColor = UIColor(named: ViewColors.backgroundColor)
        tableView.backgroundColor = UIColor(named: ViewColors.backgroundColor)
    }
    
    func makeTitleLabel() {
        titleLabel.text = labelsTitle.titleLabel
        titleLabel.textColor = UIColor(named: ViewColors.titleColor)
        titleLabel.font = .boldSystemFont(ofSize: 34)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ToDoCell.self,forCellReuseIdentifier: Cells.TodoCell)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(toDoCreateButton.snp.topMargin).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
    
    func makeToDoCreateButton() {
        toDoCreateButton.setTitle(buttonsTitle.createReminderButton, for: .normal)
        let color = UIColor(named: ViewColors.titleColor)
        toDoCreateButton.setTitleColor(color, for: .normal)
        toDoCreateButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        toDoCreateButton.layer.borderWidth = 2
        toDoCreateButton.layer.borderColor = UIColor(named: ViewColors.borderColor)?.cgColor
        toDoCreateButton.layer.cornerRadius = 12
        toDoCreateButton.snp.makeConstraints { make in
            make.height.equalTo(titleLabel)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(view.snp.bottom).offset(-60)
            make.width.equalTo(200)
        }
    }
    
}
