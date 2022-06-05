//
//  ToDolList.swift
//  ToDoList
//
//  Created by TarıkOzturk on 4.06.2022.
//

import Foundation
import UIKit

struct ToDoListItems {
    var Title : String
    var Date : String
}


struct Cells {
    static let TodoCell = "ToDoCell"
}

struct AccessView {
    var ToDoListVC = ToDoListViewController()
    var DetailToDoVC = DetailToDoViewController()
    var CreateToDoVC = CreateToDoViewController()
    var DateAndTimeVC = DateAndTimeViewController()
    
    init(ToDoListVC : UIViewController, DetailToDoVC : UIViewController, CreateToDoVC : UIViewController, DateAndTimeVC : UIViewController ) {
        self.ToDoListVC = ToDoListVC as! ToDoListViewController
        self.DetailToDoVC = DetailToDoVC as! DetailToDoViewController
        self.CreateToDoVC = CreateToDoVC as! CreateToDoViewController
        self.DateAndTimeVC = DateAndTimeVC as! DateAndTimeViewController
        
    }
 
}
