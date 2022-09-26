//
//  MyModel.swift
//  TableViewEditing
//
//  Created by iMac on 2022/09/22.
//

import Foundation
import RxDataSources

struct Person {
    var name: String
    var age: Int
}

extension Person: IdentifiableType, Equatable {
    var identity: String {
        return UUID().uuidString
    }
}
