//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit

class CreateToDoViewController : UIViewController {
    
    let cancelButton = UIButton()
    let reminderLabel = UILabel()
    let textView = UITextView()
    let DateAndTimeLabel = UILabel()
    let timePicker = UIDatePicker()
    let createReminderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc func backTodoList() {
        globalVar.toDoListVC.updateTableViewData()
        dismiss(animated: true)
    }
    
    // MARK: todotextviewresult
    @objc func createFinish(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        let dateTimeString = formatter.string(from: timePicker.date)
        let entered = ToDoListItems(Title: textView.text, Date: dateTimeString)
        globalVar.toDoLists.append(entered)
        globalVar.toDoCell.save()
        globalVar.toDoListVC.updateTableViewData()
        dismiss(animated: true)
    }
    
}


