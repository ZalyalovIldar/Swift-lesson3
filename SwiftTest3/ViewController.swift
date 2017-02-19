//
//  ViewController.swift
//  SwiftTest3
//
//  Created by Ildar Zalyalov on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let usersArr:[Any] = DataManager.generateUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.cellIdentifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellIdentifier, for: indexPath as IndexPath) as! CustomCell

        return compliteDataTo(Cell: cell, withUserData: self.usersArr[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func compliteDataTo(Cell cell:CustomCell, withUserData data:Any) -> CustomCell {
        if let user = data as? ManProfile {
            cell.nameLabel.text = user.fullName()
            cell.dataOfBirthLabel.text = user.dateOfBirth.dateToFormatedString()
            cell.sexLabel.text = user.sex
        }else {
            let user = data as? WomanProfile
            cell.nameLabel.text = user?.fullName()
            cell.dataOfBirthLabel.text = user?.dateOfBirth.dateToFormatedString()
            cell.sexLabel.text = user?.sex
        }
        return cell;
    }
}
