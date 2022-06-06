//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by TarıkOzturk on 3.06.2022.
//
import UIKit
import SnapKit

var toDoLists: [ToDoListItems] = []
var createToDoVC = CreateToDoViewController()
var dateAndTimeVC = DateAndTimeViewController()
var toDoListVC = ToDoListViewController()
var detailToDoVC = DetailToDoViewController()

class ToDoListViewController : UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    private let toDoCreateButton = UIButton()
    var toDoCell1 = ToDoCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableViewData()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func updateTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    private func configureView() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(toDoCreateButton)
        view.backgroundColor = .white
        drawDesign()
        makeTitleLabel()
        makeTableView()
        makeToDoCreateButton()
        toDoCreateButton.addTarget(self, action: #selector(openCreateTodoView), for: .touchUpInside)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        view.addSubview(self.tableView)
    }
    
    @objc func openCreateTodoView() {
        let createToDoVC = CreateToDoViewController()
        createToDoVC.modalPresentationStyle = .fullScreen
        present(createToDoVC, animated: true, completion: nil)
    }
    
    private func drawDesign() {
        self.view.backgroundColor = .white
        tableView.backgroundColor = .clear
        titleLabel.text = "ToDoList"
    }
    
    private func makeTitleLabel() {
        titleLabel.textColor = .purple
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ToDoCell.self,forCellReuseIdentifier: Cells.TodoCell)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-10)
            
        }
    }
    
    private func makeToDoCreateButton() {
        toDoCreateButton.setTitle("+", for: .normal)
        toDoCreateButton.setTitleColor(UIColor.purple, for: .normal)
        toDoCreateButton.titleLabel?.font = .boldSystemFont(ofSize: 24)
        toDoCreateButton.layer.borderWidth = 1
        toDoCreateButton.layer.cornerRadius = 12
        toDoCreateButton.clipsToBounds = true
        toDoCreateButton.layer.masksToBounds = true
        toDoCreateButton.snp.makeConstraints { make in
            make.height.equalTo(titleLabel)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.top.equalTo(titleLabel)
        }
    }
}

