//
//  FilterViewController.swift
//  SwiftTest3
//
//  Created by Ленар on 19.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let filtersNameArr:[String] = DataManager.getFiltersNameArr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(FilterCustomViewCell.nib, forCellReuseIdentifier: FilterCustomViewCell.cellIdentifier)
    }

    @IBAction func closeFilterAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filtersNameArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterCustomViewCell.cellIdentifier, for: indexPath as IndexPath) as! FilterCustomViewCell
        cell.filterLabel.text = filtersNameArr[indexPath.row]
        return cell
    }
}
