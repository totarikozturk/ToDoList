//
//  Extensions.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
//
import Foundation

extension ToDoCell {
    
    func save() {
        guard let data = try? JSONEncoder().encode(globalVar.toDoLists) else { return }
        UserDefaults.standard.set(data, forKey: Code.codableKey)
    }
    
    func load() {
        guard let loadedData = UserDefaults.standard.data(forKey: Code.codableKey)  else { return }
        do {
            globalVar.toDoLists = try JSONDecoder().decode([ToDoListItems].self, from: loadedData)
            globalVar.toDoListVC.tableView.reloadData()
        } catch { print(error) }
    }
    
}
