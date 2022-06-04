//
//  Extensions.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
//

import UIKit

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
