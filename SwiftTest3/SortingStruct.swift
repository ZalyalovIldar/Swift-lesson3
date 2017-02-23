//
//  SortingStruct.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 23.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

class SortingStruct<T> { //и да, это класс))
    var sortName: String!
    var isDoing: Bool
    var sortType:(T, T) -> Bool
    
    init() {
        sortName = ""
        isDoing = false
        sortType = {_,_ in
            return false
        }
    }
    
    init(sortName: String, isDoing: Bool, sortType:@escaping (T, T) -> Bool) {
        self.sortName = sortName
        self.isDoing = isDoing
        self.sortType = sortType
    }
}
