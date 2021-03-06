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
        makeReminderLabel()
        makeTextView()
        makeDateAndTimeLabel()
        makeTimePicker()
        makeDoneButton()
    }
    
    func drawDesign() {
        view.addSubview(cancelButton)
        view.addSubview(reminderLabel)
        view.addSubview(textView)
        view.addSubview(DateAndTimeLabel)
        view.addSubview(timePicker)
        view.addSubview(createReminderButton)
        
        view.backgroundColor = UIColor(named: ViewColors.backgroundColor)
        textView.backgroundColor = .systemFill
        cancelButton.addTarget(self, action: #selector(backTodoList), for: .touchUpInside)
        createReminderButton.addTarget(self, action: #selector(createFinish), for: .touchUpInside)
    }
    
    func makeCancelButton() {
        let config = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "chevron.left", withConfiguration: config)
        cancelButton.setImage(image, for: .normal)
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
    
    func makeReminderLabel() {
        reminderLabel.text = labelsTitle.createReminderLabel
        reminderLabel.textColor = UIColor(named: ViewColors.titleColor)
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
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 24)
        textView.backgroundColor = UIColor(named: ViewColors.textBackgroundColor)
        textView.snp.makeConstraints { make in
            make.top.equalTo(reminderLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    func makeDateAndTimeLabel() {
        DateAndTimeLabel.text = labelsTitle.setDateAndTimeLabel
        DateAndTimeLabel.textColor = UIColor(named: ViewColors.titleColor)
        DateAndTimeLabel.font = .boldSystemFont(ofSize: 20)
        DateAndTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    
    func makeTimePicker() {
        timePicker.tintColor = UIColor(named: ViewColors.titleColor)
        timePicker.layer.cornerRadius = 15
        timePicker.datePickerMode = .dateAndTime
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(DateAndTimeLabel.snp_bottomMargin).offset(10)
            make.centerX.equalTo(textView.snp.centerX)
        }
    }
    
    func makeDoneButton() {
        createReminderButton.setTitle(buttonsTitle.createButton, for: .normal)
        let color = UIColor(named: ViewColors.titleColor)
        createReminderButton.setTitleColor(color, for: .normal)
        createReminderButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        createReminderButton.layer.masksToBounds = true
        createReminderButton.layer.borderWidth = 1
        createReminderButton.layer.borderColor =  UIColor(named: ViewColors.borderColor)?.cgColor
        createReminderButton.layer.cornerRadius = 16
        createReminderButton.clipsToBounds = true
        createReminderButton.snp.makeConstraints { make in
            make.height.equalTo(reminderLabel)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.top.equalTo(view.snp.bottom).offset(-60)
        }
    }
    
}
