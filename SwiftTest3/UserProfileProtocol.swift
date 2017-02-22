//
//  UserProfileProtocol.swift
//  SwiftTest3
//
//  Created by Наталья on 21.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

protocol UserProfile {
    var firstName:String {get set}
    var lastName:String {get set}
    var birthDate:Date {get set}
    
    func getFullName() -> String
}


