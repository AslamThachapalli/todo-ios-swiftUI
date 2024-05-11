//
//  TodoItem.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueData: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
