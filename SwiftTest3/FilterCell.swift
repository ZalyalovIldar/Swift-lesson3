//
//  FilterCell.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 23.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var nameFilterLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    var switchClouser: ((Bool) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func swithAction(_ sender: UISwitch) {
        if let fClosure = self.switchClouser {
            fClosure(sender.isOn)
        }
    }
}
