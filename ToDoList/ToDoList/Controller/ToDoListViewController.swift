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
    private let tableView = UITableView()
    private let toDoCreateButton = UIButton()
    var toDoLists: [ToDoListItems] = []
    
    struct Cells {
        static let TodoCell = "ToDoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoLists = fetchData()
        configureView()
        
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
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
            make.left.right.equalTo(titleLabel)
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
            make.right.equalTo(titleLabel).offset(-5)
            make.top.equalTo(titleLabel)
        }
    }
    
}

extension ToDoListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.TodoCell) as! ToDoCell
        let ToDo = toDoLists[indexPath.row]
        cell.set(toDoList: ToDo)
        return cell
    }
    
    
}

extension ToDoListViewController {
    
    func fetchData() -> [ToDoListItems] {
        let Todo1 = ToDoListItems(Title: "Tarık Öztürk", Date: "4june2022")
        let Todo2 = ToDoListItems(Title: "Bu işi yapıyor", Date: "4june2022")
        let Todo3 = ToDoListItems(Title: "Game", Date: "4june2022")
        let Todo4 = ToDoListItems(Title: "Game", Date: "4june2022")
        return [Todo1,Todo2,Todo3,Todo4]
    }
}
