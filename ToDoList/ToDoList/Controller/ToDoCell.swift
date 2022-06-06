//
//  TodoCell.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    var toDoTitleLabel = UILabel()
    var toDoTimeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(toDoTitleLabel)
        addSubview(toDoTimeLabel)
        configureTitleLabel()
        configureTimeLabel()
        setToDoTitleLabelConstrainsts()
        setToDoTimeLabelConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(toDoList: ToDoListItems) {
        toDoTitleLabel.text = toDoList.Title
        toDoTimeLabel.text = toDoList.Date
    }
    
    func configureTitleLabel() {
        toDoTitleLabel.numberOfLines = 0
        toDoTitleLabel.adjustsFontSizeToFitWidth = true
        toDoTitleLabel.textColor = .systemTeal
        toDoTitleLabel.font = .boldSystemFont(ofSize: 24)
    }
    
    func configureTimeLabel() {
        toDoTimeLabel.numberOfLines = 0
        toDoTimeLabel.adjustsFontSizeToFitWidth = true
        toDoTimeLabel.textColor = .darkGray
        toDoTimeLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setToDoTitleLabelConstrainsts() {
        toDoTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(5)
        }
    }
    
    func setToDoTimeLabelConstrainsts() {
        toDoTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(toDoTitleLabel).offset(30)
            make.leading.equalTo(toDoTitleLabel).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
    }
}
