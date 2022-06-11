//
//  Extensions.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
//
import UIKit

extension ToDoListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalVar.toDoLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.TodoCell) as! ToDoCell
        let ToDo = globalVar.toDoLists[indexPath.row]
        cell.toDoTimeLabel.text = ToDo.Date
        cell.toDoTitleLabel.text = ToDo.Title
        cell.doneButton.tag = indexPath.row
        cell.doneButton.addTarget(self, action: #selector(removeCell), for: .touchUpInside)
        return cell
    }
    
    @objc func removeCell(sender: UIButton) {
        globalVar.toDoLists.remove(at: sender.tag)
        globalVar.toDoCell.save()
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailToDoVC = DetailToDoViewController()
        detailToDoVC.modalPresentationStyle = .fullScreen
        detailToDoVC.detailNotesLabel.text = globalVar.toDoLists[indexPath.row].Title
        globalVar.toDolistsRowValue = indexPath.row
        detailToDoVC.detailDateAndTimeLabel.text = globalVar.toDoLists[indexPath.row].Date
        present(detailToDoVC, animated: true, completion: nil)
    }
}
