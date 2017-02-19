//
//  Extentions.swift
//  SwiftTest3
//
//  Created by Ленар on 19.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation
import UIKit

extension UserProfile {
    func fullName() -> String {
        return "\(self.lastName) \(self.firstName)"
    }
    
    func printUserInfo(sex:String){
        print("Name: \(self.fullName()), Data of Birth: \(self.dateOfBirth), Sex: \(sex)")
    }

}

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

extension Date {
    static func randomDate() -> Date{
        let timeInterval = TimeInterval(arc4random_uniform(60*60*24*31*12*30))
        let sinceDate = Date.init(timeIntervalSinceNow: -60*60*24*31*12*50)
        return Date(timeInterval:timeInterval , since: sinceDate)
    }
    func dateToFormatedString() -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        return fmt.string(from: self)
    }
}
