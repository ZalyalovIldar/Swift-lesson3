//
//  UserDataSource.swift
//  SwiftTest3
//
//  Created by Наталья on 21.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation
import UIKit



class UserDataSource: NSObject, UITableViewDataSource {
    
    lazy var users:[UserProfile] = self.generateUsers()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellIdentifier, for: indexPath as IndexPath) as! CustomCell
        let user = users[indexPath.row]
        cell.nameLabel.text = user.getFullName()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        cell.birthDateLabel.text = formatter.string(from: user.birthDate)
        
        if (user is WomanProfile) {
            cell.sexLabel.text = (user as! WomanProfile).sex
        }else {
            cell.sexLabel.text = (user as! MenProfile).sex
        }
        return cell


        
    }
    
    func generateUsers() -> Array<UserProfile> {
        
        let manFirstNameArray:[String] = ["Sergey","Mars","Artem","Michael"]
        let manLastNameArray:[String] = ["Pushkin","Musin","Petrow","Lorenz"]
        
        let womanFirstNameArray:[String] = ["Natasha","Masha","Ariana","Sveta"]
        let womanLastNameArray:[String] = ["Petrova","Ivanova","Lorenz","Musina"]
        
        var userArray:[UserProfile] = Array()
        
        for i in 0...3{
            let man = MenProfile(firstName: manFirstNameArray[i], lastName: manLastNameArray[i], birthDate:Date.getRandomDate())
            let woman = WomanProfile(firstName: womanFirstNameArray[i], lastName: womanLastNameArray[i], birthDate: Date.getRandomDate())
            
            userArray.append(man)
            userArray.append(woman)
            
        }
        return userArray
        
    }
    
}

