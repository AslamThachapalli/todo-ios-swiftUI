//
//  User.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
