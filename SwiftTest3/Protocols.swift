//
//  Protocols.swift
//  SwiftTest3
//
//  Created by Ленар on 19.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation
import UIKit

protocol UserProfile {
    var firstName:String{get set};
    var lastName:String{get set};
    var dateOfBirth:Date{get set};
    
    func fullName() -> String;
    func printUserInfo(sex:String);
}

protocol FilterActionDelegate {
    func switchDidChanged(filter:String)
}

protocol FilterDelegate {
    func sortTable(WithFilter filter:String)
}
