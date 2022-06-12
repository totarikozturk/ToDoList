//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit
import FSCalendar

class DateAndTimeViewController : UIViewController, FSCalendarDelegate {
    
    let cancelButton = UIButton()
    let setDateAndTimeButton = UIButton()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let timeLabelTitle = UILabel()
    var calendar = FSCalendar()
    var toDoDateAndTimeResult : String = ""
    var timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubview(cancelButton)
        view.addSubview(setDateAndTimeButton)
        view.addSubview(calendar)
        view.addSubview(timePicker)
        view.addSubview(dateLabel)
        view.addSubview(timeLabel)
        view.addSubview(timeLabelTitle)
        view.backgroundColor = .white
        dateLabel.backgroundColor = .systemFill
        timeLabel.backgroundColor = .systemFill
        makeCancelButton()
        makeDoneButton()
        makeDateLabel()
        makeTimeLabel()
        makeTimeLabelTitle()
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
    
    func makeCalendar() {
        calendar.delegate = self
        calendar.frame = CGRect(x: 0, y: 80 , width: view.frame.size.width, height: view.frame.size.width)
    }
    
    func makeTimeLabelTitle() {
        timeLabelTitle.text = "Set Time"
        timeLabelTitle.textColor = .purple
        timeLabelTitle.font = .boldSystemFont(ofSize: 34)
        timeLabelTitle.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottomMargin).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func makeTimePicker() {
        timePicker.datePickerMode = .time
        timePicker.snp.makeConstraints { make in
            make.top.equalTo(timeLabelTitle.snp.bottomMargin).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
        }
    }
    
    func makeDateLabel() {
        dateLabel.layer.cornerRadius = 15
        dateLabel.clipsToBounds = true
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(timePicker.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    func makeTimeLabel() {
        timeLabel.layer.cornerRadius = 15
        timeLabel.clipsToBounds = true
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(40)
        }
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        // MARK: todoDateAndTimeResults
        toDoDateAndTimeResult = string
        dateLabel.text = string
        let formatterr = DateFormatter()
        formatterr.timeStyle = .medium
        let dateTimeString = formatterr.string(from: timePicker.date)
        timeLabel.text = dateTimeString
        print(string)
    }
    
    func makeDoneButton() {
        setDateAndTimeButton.setTitle("Set Date & Time", for: .normal)
        setDateAndTimeButton.setTitleColor(UIColor.purple, for: .normal)
        setDateAndTimeButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        setDateAndTimeButton.layer.masksToBounds = true
        setDateAndTimeButton.layer.borderWidth = 1
        setDateAndTimeButton.layer.cornerRadius = 16
        setDateAndTimeButton.clipsToBounds = true
        setDateAndTimeButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.top.equalTo(view.snp.bottom).offset(-60)
            make.height.equalTo(timeLabel)
        }
    }
}


