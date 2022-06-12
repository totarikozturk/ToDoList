//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by TarıkOzturk on 3.06.2022.
//
import UIKit
import SnapKit

class ToDoListViewController : UIViewController {
    
    let titleLabel = UILabel()
    let tableView = UITableView()
    let toDoCreateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableViewData()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTableViewData()
    }
    
    func updateTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        globalVar.toDoCell.load()
    }
    
    @objc func openCreateTodoView() {
        let navigation = UINavigationController(rootViewController: CreateToDoViewController())
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation,animated: true,completion: nil)
    }
    
}

