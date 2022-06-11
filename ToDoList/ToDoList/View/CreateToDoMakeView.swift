//
//  CreateToDoMakeView.swift
//  ToDoList
//
//  Created by TarıkOzturk on 11.06.2022.
//

import UIKit

extension CreateToDoViewController {
    
    func configureView() {
        drawDesign()
        makeCancelButton()
        makeDoneButton()
        makeTextView()
        makeReminderLabel()
        makeDateAndTimeLabel()
        makeSetDateAndTimeButton()
        makeTimePicker()
    }
    
    func drawDesign() {
        view.addSubview(cancelButton)
        view.addSubview(doneButton)
        view.addSubview(reminderLabel)
        view.addSubview(textView)
        view.addSubview(DateAndTimeLabel)
        view.addSubview(setDateAndTimeButton)
        view.addSubview(timePicker)
        view.backgroundColor = .white
        textView.backgroundColor = .lightGray
        cancelButton.addTarget(self, action: #selector(backTodoList), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(createFinish), for: .touchUpInside)
    }
    
    func makeCancelButton() {
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
    
    func makeDoneButton() {
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
    
    func makeReminderLabel() {
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
    
    func makeTextView() {
        textView.snp.makeConstraints { make in
            make.top.equalTo(reminderLabel.snp.bottom).offset(30)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    func makeDateAndTimeLabel() {
        DateAndTimeLabel.text = "Set Date & Time"
        DateAndTimeLabel.textColor = .darkText
        DateAndTimeLabel.font = .boldSystemFont(ofSize: 24)
        DateAndTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    
    func makeSetDateAndTimeButton() {
        setDateAndTimeButton.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        setDateAndTimeButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(30)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
    }
    
    func makeTimePicker() {
        timePicker.datePickerMode = .dateAndTime
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(setDateAndTimeButton.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
    }
    
}
