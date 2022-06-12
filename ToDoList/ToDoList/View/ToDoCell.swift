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
    let size:CGFloat = 30.0
    
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
        contentView.backgroundColor = .systemFill
        addSubview(toDoTitleLabel)
        addSubview(toDoTimeLabel)
        contentView.addSubview(doneButton)
        doneButton.bounds = CGRect(x: 0, y: 0, width: size, height: size)
        doneButton.layer.cornerRadius = size / 2
        doneButton.layer.borderWidth = 3.0
        doneButton.layer.backgroundColor = UIColor.clear.cgColor
        doneButton.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        
    }
    override func layoutSubviews() {
          super.layoutSubviews()
          let bottomSpace: CGFloat = 10.0
          self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
     }
    
    private func makeDoneButton() {
        doneButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(5)
        }
    }
    
    private func makeTitleLabel() {
        toDoTitleLabel.numberOfLines = 0
        toDoTitleLabel.adjustsFontSizeToFitWidth = true
        toDoTitleLabel.textColor = .systemTeal
        toDoTitleLabel.font = .boldSystemFont(ofSize: 24)
        toDoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(doneButton).offset(-30)
            make.left.equalTo(doneButton.snp_rightMargin).offset(20)
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
