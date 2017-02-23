//
//  FilterVC.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 22.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    var sortingList: [SortingStruct<UserProfile>]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(FilterCell.nib, forCellReuseIdentifier: FilterCell.cellIdentifier)
    }
    
    /// и так сойдет
    func offAllSort() {
        guard let sortList = self.sortingList else {return}
        sortList.forEach{$0.isDoing = false}
        
        self.tableView.reloadData()
    }
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard self.sortingList != nil else {return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.cellIdentifier, for: indexPath as IndexPath) as! FilterCell
        
        let sort = self.sortingList![indexPath.row]
        cell.nameFilterLabel.text = sort.sortName
        cell.switcher.isOn = sort.isDoing
        
        cell.switchClouser = {[weak self] in
            guard $0 == true else {sort.isDoing = $0; return}
            self?.offAllSort()
            sort.isDoing = $0
            self?.dismiss(animated: true, completion: nil)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.sortingList != nil) ? self.sortingList!.count : 0
    }
}
