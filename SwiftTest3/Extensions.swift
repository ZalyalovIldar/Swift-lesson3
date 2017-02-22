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

extension UserProfile {
    func getFullName() -> String {
        print("User name:\(firstName) lastname:\(lastName)")
        
        return "\(firstName) \(lastName)"
    }
}


extension Date{
   static func getRandomDate() -> Date {
        var componentDate = DateComponents()
         componentDate.year = 1980
        let concreteDate = Calendar.init(identifier: Calendar.Identifier.gregorian).date(from: componentDate)
        
            let randomInterval = TimeInterval(arc4random_uniform(60*60*24*31*12*25))
            let date = Date(timeInterval: randomInterval, since:concreteDate!)
        
        
        return date
        
    }
}
