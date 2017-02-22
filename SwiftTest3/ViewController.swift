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
    let dataSource = UserDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = dataSource
        
       
        
        self.tableView.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue" {
            let vc: UINavigationController = segue.destination as! UINavigationController
            let filterController: FilterViewController = vc.viewControllers.first as! FilterViewController
            filterController.delegate = self
        }
    }
    
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension ViewController: FilterViewControllerDelegate{
    func sort(by filter:Filter){
        var users = dataSource.users
        switch filter {
        case .name:
            users.sort{$0.firstName < $1.firstName}
        case .lastName:
            users.sort{$0.lastName < $1.lastName}
        case .birthDate:
            users.sort{$0.birthDate < $1.birthDate}
        case .sex:
            
            var man:[MenProfile] = Array()
            var woman:[WomanProfile] = Array()
            
            for var user in users {
                if user is MenProfile {
                    man.append(user as! MenProfile)
                }else {
                    woman.append(user as! WomanProfile)
                }
            }
            users.append(woman as! UserProfile)
            users.append(man as! UserProfile)
            
//            users = woman
//            users.append(man)
        }
        dataSource.users = users
        tableView.reloadData()
        
    }
}


extension ViewController: InfoActionDelegate{
    func infoButtonDidTap(button: UIButton) {
         self.performSegue(withIdentifier: "segue", sender: button)
    }
}
