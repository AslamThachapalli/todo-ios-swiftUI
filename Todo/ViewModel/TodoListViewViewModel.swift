//
//  TodoListViewViewModel.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import FirebaseFirestore
import Foundation

class TodoListViewViewModel : ObservableObject {
    @Published var showNewItemView = false
    
    private var userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete List Item
    /// - Parameter id: Item id to Delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
