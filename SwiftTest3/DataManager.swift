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
        let manFirstNameArr:[String] = ["Александр","Максим","Иван","Артем","Никита"];
        let womanFirstNameArr:[String] = ["Анастасия","Анна","Мария","Елена","Дарья"];
        let lastNameArr:[String] = ["Иванов","Васильев","Петров","Смирнов","Михайлов"];
        var usersArray:[Any] = [];
        for i in 0..<5 {
            let manUser = ManProfile(firstName: manFirstNameArr[i], lastName: lastNameArr[i], dateOfBirth: Date.randomDate())
            let womanUser = WomanProfile(firstName: womanFirstNameArr[i], lastName: "\(lastNameArr[4-i])а", dateOfBirth: Date.randomDate())
            usersArray.append(manUser);
            usersArray.append(womanUser)
        }
        return usersArray
    }
    
    class func getFiltersNameArr() -> [String] {
        let arr = ["Имя","Фамилия","Дата рождения","Пол"]
        return arr
    }
}
