//  ToDolList.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//

var toDoLists: [ToDoListItems] =  []
var createToDoVC = CreateToDoViewController()
var dateAndTimeVC = DateAndTimeViewController()
var toDoListVC = ToDoListViewController()
var detailToDoVC = DetailToDoViewController()
var toDoCell = ToDoCell()

struct ToDoListItems: Codable {
    var Title : String
    var Date : String
}

struct Cells {
    static let TodoCell = "ToDoCell"
}
