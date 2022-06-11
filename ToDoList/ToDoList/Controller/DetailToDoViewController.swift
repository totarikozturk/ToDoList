//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit

class  DetailToDoViewController: UIViewController {
    
    let cancelButton = UIButton()
    let doneButton = UIButton()
    let notesLabel = UILabel()
    let dateAndTimelabel = UILabel()
    var detailNotesLabel = UITextView()
    var detailDateAndTimeLabel = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @objc func backTodoList() {
        dismiss(animated: true)
    }
    
    @objc func createFinish(_ sender: Any) {
        guard let newDetailNotesLabel = detailNotesLabel.text else { return }
        guard let newDetailDateAndTimeLabel = detailDateAndTimeLabel.text else { return }
        let entered = ToDoListItems(Title: newDetailNotesLabel, Date: newDetailDateAndTimeLabel)
        globalVar.toDoLists.remove(at: globalVar.toDolistsRowValue)
        globalVar.toDoLists.insert(entered, at: globalVar.toDolistsRowValue)
        globalVar.toDoCell.save()
        dismiss(animated: true)
    }
    
}


