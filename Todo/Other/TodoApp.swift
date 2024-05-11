//
//  TodoApp.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
