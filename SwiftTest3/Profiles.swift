//
//  Profiles.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 22.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

func getUsersProfile() -> [UserProfile] {
    
    func getProfileWith(dict:[String:String], sex: Gender) -> UserProfile {
        
        let rand = Int(arc4random_uniform(86400*365*20))
        
        var profile = sex.getProfile() 
        profile.birthDay = Date(timeIntervalSince1970: TimeInterval(rand))
        profile.name = dict["firstName"]
        profile.lastName = dict["secondName"]
        
        return profile
    }
    
    var userProfileArr : [UserProfile] = Array()
    
    let manNames = [["firstName" : "Justin", "secondName" : "Bieber"],
                    ["firstName" : "Tony", "secondName" : "Raut"],
                    ["firstName" : "Bon", "secondName" : "Jovy"],
                    ["firstName" : "Ramin", "secondName" : "Djawadi"],]
    
    let womanNames = [["firstName" : "Taylor", "secondName" : "Swift"],
                    ["firstName" : "Lady", "secondName" : "Gaga"],
                    ["firstName" : "Shakira", "secondName" : "Shakira"],
                    ["firstName" : "Lana", "secondName" : "Del Rey"],]
    
    for dict in manNames {
        let man = getProfileWith(dict: dict, sex: Gender.man)
        userProfileArr.append(man)
    }
    
    for dict in womanNames {
        let man = getProfileWith(dict: dict, sex: Gender.woman)
        userProfileArr.append(man)
    }
    
    return userProfileArr
}

func getSortingList() -> [SortingStruct<UserProfile>] {
    var list = Array<SortingStruct<UserProfile>>()
    
    list.append(SortingStruct(sortName: "by name",
                              isDoing: false,
                              sortType: { (first: UserProfile, second: UserProfile) -> Bool in
                                return first.name < second.name
    }))
    
    list.append(SortingStruct(sortName: "by lastName",
                              isDoing: false,
                              sortType: { (first: UserProfile, second: UserProfile) -> Bool in
                                return first.lastName < second.lastName
    }))
    
    list.append(SortingStruct(sortName: "by birthday",
                              isDoing: false,
                              sortType: { (first: UserProfile, second: UserProfile) -> Bool in
                                return first.birthDay > second.birthDay
    }))
    
    list.append(SortingStruct(sortName: "by dominanting",
                              isDoing: false,
                              sortType: { (first: UserProfile, second: UserProfile) -> Bool in
                                return first.sex.description > second.sex.description
    }))
    
    return list
}

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

extension Gender {
    func getProfile() -> UserProfile {
        switch self {
        case .man:
            return ManProfile()
        case .woman:
            return WomanProfile()
        }
    }
}
