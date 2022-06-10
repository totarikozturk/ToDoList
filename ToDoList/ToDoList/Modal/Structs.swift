//  ToDolList.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//
import Foundation

var createToDoVC = CreateToDoViewController()
var dateAndTimeVC = DateAndTimeViewController()
var toDoListVC = ToDoListViewController()
var detailToDoVC = DetailToDoViewController()
var toDoCell = ToDoCell()
var toDolistsIndexPathRowValue = IndexPath()
var toDolistsRowValue = Int()
var toDoLists = [ToDoListItems]()

let CodableKey = "CodableKey"

struct ToDoListItems: Codable {
    var Title : String
    var Date : String
}

struct Cells {
    static let TodoCell = "ToDoCell"
}
