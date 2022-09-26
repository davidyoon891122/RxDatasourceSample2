//
//  PersonSection.swift
//  TableViewEditing
//
//  Created by iMac on 2022/09/22.
//

import Foundation
import RxDataSources

struct PersonSection {
    var headerTitle: String
    var items: [Item]
}

extension PersonSection: AnimatableSectionModelType {
    typealias Item = Person
    
    var identity: String {
        return headerTitle
    }
    
    init(original: PersonSection, items: [Person]) {
        self = original
        self.items = items
    }
}
