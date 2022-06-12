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
        makeTimePicker()
    }
    
    func drawDesign() {
        view.addSubview(cancelButton)
        view.addSubview(createReminderButton)
        view.addSubview(reminderLabel)
        view.addSubview(textView)
        view.addSubview(DateAndTimeLabel)
        view.addSubview(timePicker)
        view.backgroundColor = .white
        textView.backgroundColor = .systemFill
        cancelButton.addTarget(self, action: #selector(backTodoList), for: .touchUpInside)
        createReminderButton.addTarget(self, action: #selector(createFinish), for: .touchUpInside)
    }
    
    func makeCancelButton() {
        cancelButton.setTitle(buttonsTitle.cancelButton, for: .normal)
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
        createReminderButton.setTitle(buttonsTitle.createButton, for: .normal)
        createReminderButton.setTitleColor(UIColor.purple, for: .normal)
        createReminderButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        createReminderButton.layer.masksToBounds = true
        createReminderButton.layer.borderWidth = 1
        createReminderButton.layer.cornerRadius = 16
        createReminderButton.clipsToBounds = true
        createReminderButton.snp.makeConstraints { make in
            make.height.equalTo(reminderLabel)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.top.equalTo(view.snp.bottom).offset(-60)
        }
    }
    
    func makeReminderLabel() {
        reminderLabel.text = labelsTitle.createReminderLabel
        reminderLabel.textColor = .purple
        reminderLabel.font = .boldSystemFont(ofSize: 24)
        reminderLabel.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    func makeTextView() {
        textView.layer.cornerRadius = 15
        textView.clipsToBounds = true
        textView.snp.makeConstraints { make in
            make.top.equalTo(reminderLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    func makeDateAndTimeLabel() {
        DateAndTimeLabel.text = labelsTitle.setDateAndTimeLabel
        DateAndTimeLabel.textColor = .purple
        DateAndTimeLabel.font = .boldSystemFont(ofSize: 20)
        DateAndTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    
    func makeTimePicker() {
        timePicker.datePickerMode = .dateAndTime
        timePicker.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 250, height: 50))
            make.top.equalTo(DateAndTimeLabel.snp_bottomMargin).offset(10)
        }
    }
    
}
