//
//  UserProfile.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 22.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

enum Gender {
    case man
    case woman
}

protocol UserProfile {
    var name: String! {get set}
    var lastName: String! {get set}
    var fullName: String {get}
    var birthDay: Date! {get set}

    var sex: Gender! {get}
    
    func printAllInfo()
}

extension UserProfile {
    var fullName: String {
        return self.name + " " + self.lastName
    }
    
    func printAllInfo() {
        print("| Fullname: \(self.fullName), birtday: \(self.birthDay!), sex: \(self.sex!)")
    }
}

enum FilterType {
    case firstName
    case secondName
}

extension Gender: CustomStringConvertible {
    var description: String {
        switch self {
        case .man:
            return "man"
        case .woman:
            return "woman"
        }
    }
}
