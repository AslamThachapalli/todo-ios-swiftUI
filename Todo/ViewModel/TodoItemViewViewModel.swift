//
//  TodoItemViewViewModel.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoItemViewViewModel: ObservableObject {
    
    func toggleDoneStatus(item: TodoItem){
        var todoCopy = item
        todoCopy.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(todoCopy.id)
            .updateData(todoCopy.asDictionary())
    }
}
