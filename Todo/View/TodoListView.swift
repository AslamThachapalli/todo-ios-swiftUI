//
//  TodoListView.swift
//  Todo
//
//  Created by Aslam Thachapalli on 24/04/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items : [TodoItem]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        
        self._viewModel = StateObject(
            wrappedValue: TodoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoItemView(item: item)
                        .swipeActions{
                            Button("Delete", action: {
                                viewModel.delete(id: item.id)
                            }).tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }.navigationTitle("Todo List")
                .toolbar{
                    Button(action: {
                        viewModel.showNewItemView = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }.sheet(isPresented: $viewModel.showNewItemView, content: {
                    NewTodoItemView( newItemPresented: $viewModel.showNewItemView)
                })
        }
    }
}

#Preview {
    TodoListView(userId: "LbkUMRJUs3Wbdlv2N0uNacQVFHk2")
}
