//
//  DetailToDoMakeView.swift
//  ToDoList
//
//  Created by TarıkOzturk on 11.06.2022.
//

import UIKit

extension DetailToDoViewController {
    
    func configureView() {
        drawDesign()
        makeCancelButton()
        makeDoneButton()
        makeNotesLabel()
        makeDetailNotesLabel()
        makeDateAndTimeLabel()
        makeDetailDateAndTimeLabel()
    }
    
    func drawDesign() {
        view.addSubview(cancelButton)
        view.addSubview(doneButton)
        view.addSubview(notesLabel)
        view.addSubview(detailNotesLabel)
        view.addSubview(dateAndTimelabel)
        view.addSubview(detailDateAndTimeLabel)
        view.backgroundColor = .white
        detailNotesLabel.backgroundColor = .darkGray
        detailDateAndTimeLabel.backgroundColor = .darkGray
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
    
    func makeNotesLabel() {
        notesLabel.text = "Notes"
        notesLabel.textColor = .purple
        notesLabel.font = .boldSystemFont(ofSize: 24)
        notesLabel.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp_bottomMargin).offset(20)
            make.left.equalTo(view).offset(10)
        }
    }
    
    func makeDetailNotesLabel() {
        detailNotesLabel.font = .systemFont(ofSize: 24)
        detailNotesLabel.snp.makeConstraints { make in
            make.top.equalTo(notesLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(60)
        }
    }
    
    func makeDateAndTimeLabel() {
        dateAndTimelabel.text = "Date & Time "
        dateAndTimelabel.textColor = .purple
        dateAndTimelabel.font = .boldSystemFont(ofSize: 24)
        dateAndTimelabel.snp.makeConstraints { make in
            make.top.equalTo(detailNotesLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(view).offset(10)
        }
    }
    
    func makeDetailDateAndTimeLabel() {
        detailDateAndTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(dateAndTimelabel.snp_bottomMargin).offset(20)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(60)
        }
    }
    
    func makeDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(UIColor.purple, for: .normal)
        doneButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        doneButton.layer.borderWidth = 1
        doneButton.layer.cornerRadius = 16
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(cancelButton)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.top.equalTo(view.snp.bottom).offset(-50)
        }
    }
    
}
