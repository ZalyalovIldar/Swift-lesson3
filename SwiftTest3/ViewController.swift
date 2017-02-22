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

    var namesArr: [UserProfile] = getUsersProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.cellIdentifier)
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.namesArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellIdentifier, for: indexPath as IndexPath) as! CustomCell
        
        let profile = self.namesArr[indexPath.row]
        
        cell.nameLabel.text = profile.fullName
        cell.genderLabel.text = profile.sex.description
        cell.birthdayLabel.text = profile.birthDay.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: InfoActionDelegate{
    func infoButtonDidTap(button: UIButton) {
         self.performSegue(withIdentifier: "segue", sender: button)
    }
}
