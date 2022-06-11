//  TodoCell.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//
import UIKit

class ToDoCell: UITableViewCell {
    
    var toDoTitleLabel = UILabel()
    var toDoTimeLabel = UILabel()
    var doneButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        drawDesign()
        makeTitleLabel()
        makeTimeLabel()
        makeDoneButton()
    }
    
    private func drawDesign() {
        addSubview(toDoTitleLabel)
        addSubview(toDoTimeLabel)
        contentView.addSubview(doneButton)
    }
    
    private func makeDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(UIColor.systemBlue, for: .normal)
        doneButton.titleLabel?.font = .systemFont(ofSize: 14)
        doneButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview()
        }
    }
    
    private func makeTitleLabel() {
        toDoTitleLabel.numberOfLines = 0
        toDoTitleLabel.adjustsFontSizeToFitWidth = true
        toDoTitleLabel.textColor = .systemTeal
        toDoTitleLabel.font = .boldSystemFont(ofSize: 24)
        toDoTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(doneButton.snp_rightMargin).offset(10)
            make.trailing.equalToSuperview().offset(5)
            make.height.equalTo(60)
        }
    }
    
    private func makeTimeLabel() {
        toDoTimeLabel.numberOfLines = 0
        toDoTimeLabel.adjustsFontSizeToFitWidth = true
        toDoTimeLabel.textColor = .darkGray
        toDoTimeLabel.font = .boldSystemFont(ofSize: 20)
        toDoTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(toDoTitleLabel).offset(30)
            make.left.equalTo(toDoTitleLabel).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
    }
    
}
