//
//  FilterViewController.swift
//  SwiftTest3
//
//  Created by Наталья on 21.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

public enum Filter: String {
    case name = "Имя"
    case lastName = "Фамилия"
    case birthDate = "Дата рождения"
    case sex = "Пол"
    
    static let count = 4
    
    static func stringValue(at index: Int) -> String? {
        switch index {
        case 0:
            return Filter.name.rawValue
        case 1:
            return Filter.lastName.rawValue
        case 2:
            return Filter.birthDate.rawValue
        case 3:
            return Filter.sex.rawValue
        default:
            return nil
        }
    }
    
    init?(index: Int) {
        switch index {
        case 0:
            self = Filter.name
        case 1:
            self = Filter.lastName
        case 2:
            self = Filter.birthDate
        case 3:
            self = Filter.sex
        default:
            return nil
        
        }
    }
    
    
}


public protocol FilterViewControllerDelegate:class{
    func sort(by filter:Filter)
}

class FilterViewController: UIViewController {
    
    weak var delegate: FilterViewControllerDelegate?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FilterViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return Filter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! TableViewCell
        cell.filterLabel.text = Filter.stringValue(at: indexPath.row)
        cell.delegate = self
        cell.filter = Filter.init(index: indexPath.row)!
        return cell
    }
}

extension FilterViewController: FilterSwitchDelegate {
    func filterSwitchDidChangeState(button: UISwitch, filter: Filter) {
        delegate?.sort(by: filter)
        dismiss(animated: true, completion: nil)
    }
}


