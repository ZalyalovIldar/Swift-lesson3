//
//  FilterCustomViewCell.swift
//  SwiftTest3
//
//  Created by Ленар on 19.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

protocol FilterActionDelegate {
    func switchDidChanged(filter:String)
}

class FilterCustomViewCell: UITableViewCell {

    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    var delegate: FilterActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func filterSwitchChanged(_ sender: UISwitch){
        guard self.delegate != nil else {assertionFailure("Be sure delegate not Nil!"); return}
        self.delegate?.switchDidChanged(filter:filterLabel.text!)
    }
    
}
