//
//  Extensions.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
//
import Foundation

extension ToDoCell {
    
    func save() {
        guard let data = try? JSONEncoder().encode(toDoLists) else { return }
        UserDefaults.standard.set(data, forKey: CodableKey)
    }
    
    func load() {
        guard let loadedData = UserDefaults.standard.data(forKey: CodableKey)  else { return }
        do {
            toDoLists = try JSONDecoder().decode([ToDoListItems].self, from: loadedData)
            toDoListVC.tableView.reloadData()
        } catch { print(error) }
    }
    
}
