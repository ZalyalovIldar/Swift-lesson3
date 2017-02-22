//
//  TableViewCell.swift
//  SwiftTest3
//
//  Created by Наталья on 22.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

public protocol FilterSwitchDelegate: class {
    func filterSwitchDidChangeState(button:UISwitch, filter: Filter)
}

class TableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var filterLabel: UILabel!
    weak var delegate: FilterSwitchDelegate?
    var filter: Filter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func filterSwitchDidChangeState(_ sender: UISwitch) {
        
        guard self.delegate != nil else {assertionFailure("Be sure delegate not Nil!"); return}
        
                self.delegate?.filterSwitchDidChangeState(button: sender, filter: filter!)
    }
}
