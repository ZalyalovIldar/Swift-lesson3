//
//  Extensions.swift
//  SwiftTest3
//
//  Created by Ildar Zalyalov on 17.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
   static var nib: UINib{
        return UINib(nibName: self.nibName, bundle: nil)
    }
    
   static var nibName: String{
        return String.init(describing: self.self)
    }
    
   static var cellIdentifier: String{
        return String.init(describing: self.self)
    }
}
