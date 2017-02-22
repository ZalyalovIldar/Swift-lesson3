//
//  Profiles.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 22.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

struct ManProfile: UserProfile {
    
    var sex: Gender! = .man
    
    var lastName: String!
    var name: String!
    var birthDay: Date!
}

struct WomanProfile: UserProfile {
    
    var sex: Gender! = .woman
    
    var lastName: String!
    var name: String!
    var birthDay: Date!
}
