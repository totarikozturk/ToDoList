//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit
import FSCalendar

class DateAndTimeViewController : UIViewController, FSCalendarDelegate {
    
    private let cancelButton = UIButton()
    private let doneButton = UIButton()
    var calendar = FSCalendar()
    var toDoDateAndTimeResult : String = ""
    var timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubview(cancelButton)
        view.addSubview(doneButton)
        view.addSubview(calendar)
        view.addSubview(timePicker)
        view.backgroundColor = .white
        makeCancelButton()
        makeDoneButton()
        makeCalendar()
        makeTimePicker()
        cancelButton.addTarget(self, action: #selector(backTodoList), for: .touchUpInside)
    }
    
    @objc func backTodoList() {
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
        doneButton.setTitle("Set Date & Time", for: .normal)
        doneButton.setTitleColor(UIColor.purple, for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        doneButton.layer.masksToBounds = true
        doneButton.layer.borderWidth = 1
        doneButton.layer.cornerRadius = 16
        doneButton.clipsToBounds = true
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(cancelButton)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
    
    private func makeCalendar() {
        calendar.delegate = self
        calendar.frame = CGRect(x: 0, y: 31 , width: view.frame.size.width, height: view.frame.size.width)
    }
    
    private func makeTimePicker() {
        timePicker.datePickerMode = .dateAndTime
        timePicker.frame = .init(x: 20, y: 100, width: timePicker.bounds.size.width, height: timePicker.bounds.size.height)
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
// MARK: todoDateAndTimeResults
        toDoDateAndTimeResult = string
        print(string)
    }
    
}


