//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit

class CreateToDoViewController : UIViewController {
    
    private let cancelButton = UIButton()
    private let doneButton = UIButton()
    private let reminderLabel = UILabel()
    private let textView = UITextView()
    private let DateAndTimeLabel = UILabel()
    private let setDateAndTimeButton = UISwitch()
    var timePicker = UIDatePicker()
    var toDoTextResult: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubview(cancelButton)
        view.addSubview(doneButton)
        view.addSubview(reminderLabel)
        view.addSubview(textView)
        view.addSubview(DateAndTimeLabel)
        view.addSubview(setDateAndTimeButton)
        view.addSubview(timePicker)
        view.backgroundColor = .white
        textView.backgroundColor = .lightGray
        makeCancelButton()
        makeDoneButton()
        makeTextView()
        makeReminderLabel()
        makeDateAndTimeLabel()
        makeSetDateAndTimeButton()
        makeTimePicker()
        cancelButton.addTarget(self, action: #selector(backTodoList), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(createFinish), for: .touchUpInside)
    }
    
    @objc func backTodoList() {
        toDoListVC.updateTableViewData()
        //        toDoLists.removeAll()
        //        toDoCell.save()
        dismiss(animated: true)
    }
    
    // MARK: todotextviewresult
    @objc func createFinish(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        let dateTimeString = formatter.string(from: timePicker.date)
        dateAndTimeVC.toDoDateAndTimeResult = dateTimeString
        createToDoVC.toDoTextResult = textView.text
        let entered = ToDoListItems(Title: createToDoVC.toDoTextResult, Date: dateAndTimeVC.toDoDateAndTimeResult)
        toDoLists.append(entered)
        toDoCell.save()
        toDoListVC.updateTableViewData()
        dismiss(animated: true)
    }
    
    private func makeCancelButton() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        cancelButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 30))
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeDoneButton() {
        doneButton.setTitle("Create", for: .normal)
        doneButton.setTitleColor(UIColor.purple, for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        doneButton.layer.masksToBounds = true
        doneButton.layer.borderWidth = 1
        doneButton.layer.cornerRadius = 16
        doneButton.clipsToBounds = true
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(cancelButton)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.top.equalTo(view.snp.bottom).offset(-50)
        }
    }
    
    private func makeReminderLabel() {
        reminderLabel.text = "Create Reminder"
        reminderLabel.textColor = .darkText
        reminderLabel.font = .boldSystemFont(ofSize: 35)
        reminderLabel.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.bottom).offset(25)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    private func makeTextView() {
        textView.snp.makeConstraints { make in
            make.top.equalTo(reminderLabel.snp.bottom).offset(30)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    private func makeDateAndTimeLabel() {
        DateAndTimeLabel.text = "Set Date & Time"
        DateAndTimeLabel.textColor = .darkText
        DateAndTimeLabel.font = .boldSystemFont(ofSize: 24)
        DateAndTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    
    private func makeSetDateAndTimeButton() {
        setDateAndTimeButton.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        setDateAndTimeButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(30)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
    }
    
    private func makeTimePicker() {
        timePicker.datePickerMode = .dateAndTime
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(setDateAndTimeButton.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch!) {
        if (sender.isOn == true){
            print("UISwitch state is now ON")
            setDateAndTimeButton.setOn(true, animated: false)
            let dateAndTimeVC = DateAndTimeViewController()
            dateAndTimeVC.modalPresentationStyle = .fullScreen
            present(dateAndTimeVC, animated: true, completion: nil)
        }
        else{
            print("UISwitch state is now Off")
        }
    }
}


