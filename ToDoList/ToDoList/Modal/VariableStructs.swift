//  ToDolList.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//
import Foundation

struct globalVar {
    static  var createToDoVC = CreateToDoViewController()
    static var toDoListVC = ToDoListViewController()
    static var detailToDoVC = DetailToDoViewController()
    static var toDoCell = ToDoCell()
    static var toDolistsIndexPathRowValue = Int()
    static var toDolistsIndexPathRowValues = IndexPath()
    static var toDolistsRowValue = Int()
    static var toDoLists = [ToDoListItems]()
}

struct ToDoListItems: Codable {
    var Title : String
    var Date : String
}

struct Code {
    static let codableKey = "CodableKey"
}

struct Cells {
    static let TodoCell = "ToDoCell"
}

struct buttonsTitle {
    static let cancelButton = "Cancel"
    static let createButton = "Create"
    static let doneButton = "Done"
    static let createReminderButton = "+ Create Reminder"
}

struct labelsTitle {
    static let titleLabel = "ToDoList"
    static let notesLabel = "Notes"
    static let dateAndTimeLabel = "Date & Time"
    static let createReminderLabel = "Create Reminder"
    static let setDateAndTimeLabel = "Set Date & Time"
}
