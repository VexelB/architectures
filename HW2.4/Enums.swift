//
//  Enums.swift
//  HW2.4
//
//  Created by Евгений Войтин on 05.07.2021.
//

import Foundation

enum Services {
    static let dBRealmService = DBRealmService()
}

enum TaskStatus {
    case created
    case completed
    case deleted
}
