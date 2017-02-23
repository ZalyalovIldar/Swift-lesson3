//
//  CustomCell.swift
//  SwiftTest3
//
//  Created by Ildar Zalyalov on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
