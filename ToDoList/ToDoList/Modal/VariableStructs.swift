//  ToDolList.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//
import Foundation

struct globalVar {
    static  var createToDoVC = CreateToDoViewController()
    static var dateAndTimeVC = DateAndTimeViewController()
    static var toDoListVC = ToDoListViewController()
    static var detailToDoVC = DetailToDoViewController()
    static var toDoCell = ToDoCell()
    static var toDolistsIndexPathRowValue = Int()
    static var toDolistsIndexPathRowValues = IndexPath()
    static var toDolistsRowValue = Int()
    static var toDoLists = [ToDoListItems]()
}

struct Code {
    static let codableKey = "CodableKey"
}

struct ToDoListItems: Codable {
    var Title : String
    var Date : String
}

struct Cells {
    static let TodoCell = "ToDoCell"
}
