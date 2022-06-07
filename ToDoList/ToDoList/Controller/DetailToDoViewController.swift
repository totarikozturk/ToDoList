//
//  CreateToDo.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
import UIKit
import SnapKit

class  DetailToDoViewController: UIViewController {
    
    private let cancelButton = UIButton()
    private let doneButton = UIButton()
    private let notesLabel = UILabel()
    private let dateAndTimelabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubview(cancelButton)
        view.addSubview(doneButton)
        view.addSubview(notesLabel)
        view.addSubview(dateAndTimelabel)
        view.backgroundColor = .systemTeal
        makeCancelButton()
        makeDoneButton()
        makeNotesLabel()
        makeDateAndTimeLabel()
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
    
    private func makeNotesLabel() {
        notesLabel.text = "Notes"
        notesLabel.textColor = .purple
        notesLabel.font = .boldSystemFont(ofSize: 24)
        notesLabel.snp.makeConstraints { make in
            make.top.equalTo(cancelButton.snp_bottomMargin).offset(20)
            make.left.equalTo(view).offset(10)
        }
    }
    
    private func makeDateAndTimeLabel() {
        dateAndTimelabel.text = "Date & Time "
        dateAndTimelabel.textColor = .purple
        dateAndTimelabel.font = .boldSystemFont(ofSize: 24)
        dateAndTimelabel.snp.makeConstraints { make in
            make.top.equalTo(notesLabel.snp_bottomMargin).offset(40)
            make.left.equalTo(view).offset(10)
        }
    }
    
    private func makeDoneButton() {
        doneButton.setTitle("Done", for: .normal)
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
}


