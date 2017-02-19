//
//  DataManager.swift
//  SwiftTest3
//
//  Created by Ленар on 19.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

class DataManager {
    
    class func generateUsers() -> [Any] {
        let manFirstNameArr:[String] = ["Александр","Максим","Иван","Артем","Никита"]
        let womanFirstNameArr:[String] = ["Анастасия","Анна","Мария","Елена","Дарья"]
        let lastNameArr:[String] = ["Иванов","Васильев","Петров","Смирнов","Михайлов"]
        var usersArray:[Any] = []
        for i in 0..<5 {
            let manUser = ManProfile(firstName: manFirstNameArr[i], lastName: lastNameArr[i], dateOfBirth: Date.randomDate())
            let womanUser = WomanProfile(firstName: womanFirstNameArr[i], lastName: "\(lastNameArr[4-i])а", dateOfBirth: Date.randomDate())
            usersArray.append(manUser)
            usersArray.append(womanUser)
        }
        return usersArray
    }
    
    class func getFiltersNameArr() -> [String] {
        let arr = ["Имя","Фамилия","Дата рождения","Пол"]
        return arr
    }
    
    class func sortArray(withObject arr:[Any], byField field:String)->[Any]?{
        var array:[UserProfile] = arr as! [UserProfile]
        
        switch field {
        case "Имя":
            array = array.sorted(by: {$0.firstName < $1.firstName})
            return array
        case "Фамилия":
            array = array.sorted(by: {$0.lastName < $1.lastName})
            return array
        case "Дата рождения":
            array = array.sorted(by: {$0.dateOfBirth < $1.dateOfBirth})
            return array
        case "Пол":
            var sortedUsers:[Any] = []
            for data in arr {
                if let user = data as? ManProfile {
                    sortedUsers.insert(user, at: 0)
                }else {
                    let user = data as? WomanProfile
                    sortedUsers.append(user!)
                }
            }
            return sortedUsers
        default:
            return nil
        }
    }
}
