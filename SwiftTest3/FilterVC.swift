//
//  FilterVC.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 22.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    var sortingList = getSortingList()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(FilterCell.nib, forCellReuseIdentifier: FilterCell.cellIdentifier)
    }
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.cellIdentifier, for: indexPath as IndexPath) as! FilterCell
        
        let sort = sortingList[indexPath.row]
        cell.nameFilterLabel.text = sort.sortName
        cell.switcher.isOn = sort.isDoing
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortingList.count
    }
}
