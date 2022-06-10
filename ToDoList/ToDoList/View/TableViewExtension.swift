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
        cell.toDoTimeLabel.text = ToDo.Date
        cell.toDoTitleLabel.text = ToDo.Title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            toDoCell.save()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailToDoVC = DetailToDoViewController()
        detailToDoVC.modalPresentationStyle = .fullScreen
        detailToDoVC.detailNotesLabel.text = toDoLists[indexPath.row].Title
        toDolistsIndexPathRowValue = indexPath
        toDolistsRowValue = indexPath.row
        detailToDoVC.detailDateAndTimeLabel.text = toDoLists[indexPath.row].Date
        present(detailToDoVC, animated: true, completion: nil)
    }
}
