//
//  Helper.swift
//  SwiftTest3
//
//  Created by Alexander Drovnyashin on 23.02.17.
//  Copyright © 2017 com.personal.ildar. All rights reserved.
//

import Foundation

struct SortingStruct<T> {
    var sortName: String!
    var isDoing: Bool 
    var sortType:(T, T) -> Bool
}
