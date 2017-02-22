//
//  CustomCell.swift
//  SwiftTest3
//
//  Created by Ildar Zalyalov on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import UIKit

protocol InfoActionDelegate {
    func infoButtonDidTap(button: UIButton)
}
class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var delegate: InfoActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        guard self.delegate != nil else {assertionFailure("Be sure delegate not Nil!"); return}
        
        self.delegate?.infoButtonDidTap(button: sender)
    }
}
