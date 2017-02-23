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
        if let sortList = self.sortingList {
            for strSort in sortList {
                if strSort.isDoing {
                    strSort.isDoing = false
                }
            }
        }
        self.tableView.reloadData()
    }
    
    deinit {
        print("deinit")
    }
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.cellIdentifier, for: indexPath as IndexPath) as! FilterCell
        
        guard self.sortingList != nil else {
            return UITableViewCell()
        }
        
        let sort = self.sortingList![indexPath.row]
        cell.nameFilterLabel.text = sort.sortName
        cell.switcher.isOn = sort.isDoing
        
        weak var weakSelf = self
        
        cell.switchClouser = {
            if $0 {
                weakSelf?.offAllSort()
                sort.isDoing = $0
                weakSelf?.dismiss(animated: true, completion: nil)
            } else {
                sort.isDoing = $0
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.sortingList != nil else {
            return 0
        }
        return self.sortingList!.count
    }
}
